class Genre < ApplicationRecord
  has_many :characterizations, dependent: :destroy
  has_many :movies, through: :characterizations

  validates :name, allow_blank:false,uniqueness: {case_sensitive:false}
end
