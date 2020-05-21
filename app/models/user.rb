class User < ApplicationRecord
    has_secure_password
    validates :username, presence: true
    validates :username, uniqueness: { case_sensitive: false }
    validates :username, format: { with: /[A-Za-z0-9]+/,
        message: "only allows letters and numbers" }

    has_many :patterns
    has_many :favorites

end
