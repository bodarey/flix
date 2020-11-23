class Review < ApplicationRecord
  STARS=[1,2,3,4,5]
  belongs_to :movie
  belongs_to :user

  validates :comment, length: {minimum: 3}
  validates :stars, inclusion: {  in: STARS,  message: "must be between 1 and 5"}


  scope :past_n_days, ->(d=30){where('created_at>=?',d.days.ago)}
end
