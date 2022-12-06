class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :phone, presence: true
    validates :email, presence: true, uniqueness: true
    validates :gender, presence: true

    has_many :cards
end
