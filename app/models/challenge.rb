class Challenge < ApplicationRecord
  has_many :chatrooms, dependent: :destroy
  has_many :dares, dependent: :destroy
  enum category: [ :solo, :friend, :grouped]
  has_one_attached :photo

  validates :name, presence: true, length: { maximum: 50 }
  validates :category, presence: true
  validates :place, presence: true
  validates :content, presence: true
  validates :difficulty, presence: true
  validates :xp, presence: true
  validates :delay, presence: true
end
