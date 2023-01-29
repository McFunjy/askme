class User < ApplicationRecord
    has_secure_password

    before_save :downcase_nickname

    validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
    validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }

    def downcase_nickname
      nickname.downcase!
    end
end
