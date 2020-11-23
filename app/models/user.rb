class User < ApplicationRecord
  has_secure_password
  has_many :reviews, dependent: :destroy 
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie
  
  validates :name, presence:true
  validates :email,presence:true, format: /\A\S+@\S+\z/,uniqueness: {case_sensitive:false}
  validates :username,presence:true, format: {with: /[a-zA-Z]*\d*/,
  message:'may contain only letters and numbers'},
  uniqueness: {case_sensitive:false}

scope :by_name, -> {all.order(name: :asc) }
scope :not_admin, ->{ by_name.where('admin==?',false)}

before_save :format_email
 before_save :format_username
################################################
  def self.authenticate email, password,username=''
       user =User.find_by(email: email) || User.find_by(username: username) 
       user && user.authenticate(password)

  end

  ##############
  private
  def format_email
    self.email=email.downcase
end

 def format_username
  self.username = username.downcase
end



  end
