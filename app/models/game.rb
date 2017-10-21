class Game < ApplicationRecord
  belongs_to :server, class_name: 'Player', foreign_key: 'server_id'

  has_many :participants, dependent: :destroy
  has_many :players, through: :participants

  has_many :points

  validates :server_id,
    presence: true
end