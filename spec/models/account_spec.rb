require 'rails_helper'

RSpec.describe Account, type: :model do
  describe 'validations' do
    describe 'email' do
      it { should validate_presence_of(:email) }
      it { should_not allow_value("blah").for(:email) }
      it { should_not allow_value("blah@111111").for(:email) }
      it { should_not allow_value("blah.blah").for(:email) }
      it { should allow_value("a@b.com").for(:email) }
    end
    
    describe 'name' do
      it { should validate_presence_of(:name) }
    end
    
    describe 'password' do
      it { should validate_presence_of (:password) }
      it { should_not allow_value("abc").for(:password) }
    end
  end
end