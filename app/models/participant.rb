class Participant < ApplicationRecord
  belongs_to :player
  belongs_to :game

  validates :score,
    inclusion: { in: [1, 0, -1] }

  validates :player_id,
    presence: true

  validates :game_id,
    presence: true
end