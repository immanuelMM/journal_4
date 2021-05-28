class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :password, length: { in: 6..12 } 
    has_secure_password

    has_many :categories
    has_many :categories, through: :task
    # has_many :tasks, through: :categories
end
