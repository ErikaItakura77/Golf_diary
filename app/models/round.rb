class Round < ApplicationRecord
  belongs_to :user
  
  validates :day, presence: true, length: { maximum: 10 }
  validates :cource, presence: true, length: { maximum: 50 }
  validates :weather, length: { maximum: 10 } 
  validates :wind, presence: true, length: { maximum: 10 }
  validates :green, length: { maximum: 10 }
  validates :tee, length: { maximum: 50 }
  validates :score_first_nine, presence: true, length: { maximum: 10 }
  validates :score_back_nine, presence: true, length: { maximum: 10 }
  validates :score_add, length: { maximum: 10 }
  validates :member1, length: { maximum: 30 }
  validates :member2, length: { maximum: 30 }
  validates :member3, length: { maximum: 30 }
  validates :member4, length: { maximum: 30 }
  validates :picture, length: { maximum: 30 }
  validates :video, length: { maximum: 30 }
end
