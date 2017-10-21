class Player < ApplicationRecord
  belongs_to :account

  has_many :first_serve_games, class_name: 'Game', foreign_key: 'server_id'

  has_many :participants, dependent: :destroy
  has_many :games, through: :participants

  validates :name,
    presence: true,
    length: { maximum: 255 }

  validates :account_id,
    presence: true
end