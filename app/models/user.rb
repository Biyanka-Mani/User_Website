class User < ApplicationRecord
    before_save{ self.email=email.downcase}
    VALID_EMAIL_REGEX=/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :firstname, presence: true
    validates :lastname ,presence: true
    validates :email ,presence: true , length: {minimum: 8},uniqueness: { case_sensitive: false },format: { with:VALID_EMAIL_REGEX}
    has_secure_password
    validates :password, length: { minimum: 8, maximum: 128 }, allow_nil: true
end
