class Journey < ApplicationRecord
  belongs_to :user
  belongs_to :dare
  validates :title, length: { maximum: 30 }
  validates :content, presence: true
  validates :challenge_rating, inclusion: { in: 0..5 }

end
