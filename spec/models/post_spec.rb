require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }
    it { expect(FactoryBot.create(:post)).to be_valid }

    it 'should give error for more than 1000 chars' do
      str = 'a' * 1001
      should_not allow_values(str).for(:content).with_message('1000 characters in post is the maximum allowed.')
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end
end
