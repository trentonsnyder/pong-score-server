class Account < ApplicationRecord
  has_secure_password

  has_many :players

  validates :email,
    uniqueness: true,
    presence: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/ },
    length: { in: 6..255 }

  validates :password,
    presence: true,
    length: { in: 6..255 },
    allow_nil: true

  validates :name,
    presence: true,
    length: { in: 1..255 }
end