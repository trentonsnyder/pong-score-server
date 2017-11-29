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

  def assignScores
    points = self.points
    if points.length >= 11
      p1_points = points.select { |p| p.player_id == points.first.id}
      p2_points = points.select { |p| p.player_id != points.first.id}
      if (p1_points.length >= 11 || p2_points.length >= 11) && ((p1_points.length - p2_points.length).abs >= 2)
        if p1_points.length > p2_points.length
          p1 = self.participants.find_by(player_id: p1_points.first.player_id)
          p2 = self.participants.where.not(player_id: p1.player_id).first
          p1.update(score: 1)
          p2.update(score: -1)
        else
          p2 = self.participants.find_by(player_id: p2_points.first.player_id)
          p1 = self.participants.where.not(player_id: p2.player_id).first
          p2.update(score: 1)
          p1.update(score: -1)
        end
      else
        return false
      end
    else
      return false
    end
  end

end