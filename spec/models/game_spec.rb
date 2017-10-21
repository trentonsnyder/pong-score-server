require 'rails_helper'

RSpec.describe Game, type: :model do
  describe 'validations' do
    describe 'server_id' do
      it { should validate_presence_of(:server_id) }
    end
  end
end