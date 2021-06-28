class User < ActiveRecord::Base
  has_secure_password

  validates_uniqueness_of :email, case_sensitive: false, presence: true
  validates :password, presence: true, length: { minimum: 5 }
  validates :firstname, :lastname, :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end
end
