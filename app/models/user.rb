class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }
    # validates :username, with: /^[A-Za-z0-9]+$/

    has_many :patterns
    has_many :favorites

end
