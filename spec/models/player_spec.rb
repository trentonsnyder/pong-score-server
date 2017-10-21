require 'rails_helper'

RSpec.describe Player, type: :model do
  describe 'validations' do
    describe 'name' do
      it { should validate_presence_of(:name) }
    end

    describe 'account_id' do
      it { should validate_presence_of(:account_id) }
    end
  end
end