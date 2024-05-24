class Enquiry < ApplicationRecord
    validates :name, presence: true
    validates :email ,presence: true
    validates :subject ,presence: true
    validates :meassage ,presence: true,length:{minimum:5,maximum:100}
end
