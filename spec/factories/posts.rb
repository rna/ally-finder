FactoryBot.define do
  factory :post do
    content { Faker::Lorem.sentence }
    user { FactoryBot.create(:user, name: 'abcdef') }
  end
end
