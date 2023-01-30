class User < ApplicationRecord
  has_secure_password

  before_validation :downcase_nickname, :downcase_email

  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/ }
  validates :nickname, uniqueness: true, length: { maximum: 40 }, format: { with: /\A\w+\z/ }
  validates :navbar_color, format: { with: /\A#([A-Fa-f0-9]{6}|[A-Fa-f0-9]{3})\z/ }

  private
    
  def downcase_nickname
    nickname&.downcase!
  end

  def downcase_email
    email&.downcase!
  end
end
