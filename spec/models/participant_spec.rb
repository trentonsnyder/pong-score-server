require 'rails_helper'

RSpec.describe Participant, type: :model do
  describe 'validations' do
    describe 'game_id' do
      it { should validate_presence_of(:game_id) }
    end

    describe 'player_id' do
      it { should validate_presence_of(:player_id) }
    end

    describe 'score' do
      it do
        should validate_inclusion_of(:score).
          in_array([0, 1, -1])
      end
    end
  end
end