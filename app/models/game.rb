class Game < ApplicationRecord
  belongs_to :server, class_name: 'Player', foreign_key: 'server_id'
  belongs_to :receiver, class_name: 'Player', foreign_key: 'receiver_id'
  belongs_to :account

  has_many :participants, dependent: :destroy
  has_many :players, through: :participants

  has_many :points

  validates :server_id,
    presence: true

  def check_deuce
    count = self.points.count
    count == 19 && self.update(deuce: false)
    if count == 20
      player1 = 0
      player2 = 0
      firstPlayer = self.players.first.id
      self.points.each do |point|
        if point.player_id == firstPlayer
          player1 += 1
        else
          player2 += 1
        end
      end
      if player1 == 10 && player2 == 10
        self.update(deuce: true)
      end
    end
  end

end