class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  has_many :messages, dependent: :destroy
  has_many :dares, dependent: :destroy
  has_many :journeys, dependent: :destroy
  has_many :challenges, through: :dares
  has_one_attached :photo

  def total_xp
    dares.where(progress: "validated").includes(:challenge).sum(:xp)
  end

  def current_level
    Level.where("xp_requirement <= ?", total_xp).last
  end

  def next_level
    Level.find(current_level.id + 1)
  end

  def lvl_xp_bar
    (total_xp - current_level.xp_requirement).fdiv(next_level.xp_requirement -
    current_level.xp_requirement) * 100
  end

  def self.find_for_facebook_oauth(auth)
    user_params = auth.slice("provider", "uid")
    user_params.merge! auth.info.slice("email", "first_name", "last_name")
    user_params[:facebook_picture_url] = auth.info.image
    user_params[:token] = auth.credentials.token
    user_params[:token_expiry] = Time.at(auth.credentials.expires_at)
    user_params = user_params.to_h

    user = User.find_by(provider: auth.provider, uid: auth.uid)
    user ||= User.find_by(email: auth.info.email) # User did a regular sign up in the past.
    if user
      user.update(user_params)
    else
      user = User.new(user_params)
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.save
    end

    return user
  end

end
