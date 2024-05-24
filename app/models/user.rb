class User < ApplicationRecord
    validates :firstname, presence: true
    validates :lastname ,presence: true
    validates :email ,presence: true , length: {minimum: 8}
    validates :password ,presence: true ,length: {minimum: 8}
end
