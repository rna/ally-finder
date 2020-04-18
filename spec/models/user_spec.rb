require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).ignoring_case_sensitivity }
    it { should_not allow_value('abcd@').for(:email) }
    it { expect(FactoryBot.create(:user, name: 'testman')).to be_valid }
  end

  describe 'associations' do
    it { should have_many(:posts) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
    it { should have_many(:frequests) }
    it { should have_many(:inverse_frequests) }
  end
end
