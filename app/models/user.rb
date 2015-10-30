class User < ActiveRecord::Base
	has_many :interests
	has_secure_password
	EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
	validates :name, presence: true
	validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
	validates :password, length: {minimum: 6}

  before_save do
    self.email.downcase!
  end

  ##### method that creates the first and ONLY user. #####
  def self.from_omniauth(auth)
  	where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
  		user.provider         = auth.provider
  		user.uid              = auth.uid
  		user.oauth_token      = auth.credentials.token
  		user.oauth_expires_at = Time.at(auth.credentials.expires_at)
  		user.name             =  auth.info.name
  		user.save
  		user.password_digest = "password"
  	end
  end
end
