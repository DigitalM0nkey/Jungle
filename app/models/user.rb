class User < ActiveRecord::Base
 
  has_secure_password

  validates :email, uniqueness: {case_sensitive: false}, format: { with: URI::MailTo::EMAIL_REGEXP }

end
