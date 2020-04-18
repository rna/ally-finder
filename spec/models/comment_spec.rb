require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:content) }

    it 'should give error for more than 200 chars' do
      str = 'a' * 201
      should_not allow_values(str).for(:content).with_message('200 characters in comment is the maximum allowed.')
    end
  end

  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end
end
