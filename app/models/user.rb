class User < ApplicationRecord
    has_secure_password
    has_many :trips

    validates :username, :password, presence: true
    validates :username, uniqueness: true
end
