class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
 # belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :fans, through: :favorites, source: :user
  has_many :characterizations,dependent: :destroy
  has_many :genres, through: :characterizations
  
  RATINGS = %w(G PG PG-13 R NC-17)

  validates :title,:released_on,:duration, presence:true,uniqueness: {case_sensitive:false}
  validates :description,length: {minimum: 25}
  validates :total_gross, numericality: {greater_than_or_equal_to: 0}
  validates :image_file_name, allow_blank: true, format: {
  with:    /\w+\.(gif|jpg|png)\z/i,
  message: "must reference a GIF, JPG, or PNG image"
}
validates_inclusion_of :raiting, in: RATINGS
validates :slug,uniqueness: {case_sensitive:false}

scope :released, -> {where('released_on < ?',Time.now).order(released_on: :desc)}
scope :hits, -> {released.where('total_gross >= 300000000').order(total_gross: :desc)}
scope :flops, -> {  released.where('total_gross < 50000000').order(total_gross: :asc)}
scope :upcoming, ->{where('released_on > ?',Time.now).order(released_on: :asc)}
scope :rated, ->(rating){released.where('raiting ==?',rating)}
scope :recent, ->(max=5){ released.limit(max) }
scope :grossed_less_than,->(n){where('total_gross < ?',n)}
scope :grossed_greater_than,->(n){where('total_gross > ?',n)}

 before_validation :generate_slug

 

#####################################################
  def flop?
    if  reviews.count>3 and reviews.average(:stars).round>=4
      return false
    end
   total_gross.to_f < 50_000_000
  end
  #####################################################
  # def self.released
  #   where('released_on<?',Time.now).order(released_on: :desc)
    
  # end
    
    #####################################################
    def average_stars
      reviews.average(:stars)
    end
    #####################################################
    def recent_reviews 
    reviews.order('created_at').limit(2)
    
    end
    #####################################################
    def to_param
    slug
    end
####################3
def generate_slug

  self.slug ||=  title.parameterize if title
  

  end


  ############
 
################################
  end
