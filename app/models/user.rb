class User < ActiveRecord::Base
 
  has_secure_password

  validates :email, presence: true, uniqueness: {case_sensitive: false}, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 7 }

  def self.authenticate_with_credentials(email_address, password)
    user = User.find_by email: email_address.strip.downcase
    if !user
      nil
    else
      if user.authenticate(password)
        user
      end
    end
  end
end
