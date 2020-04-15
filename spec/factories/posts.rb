FactoryGirl.define do
  factory :post do
    content {Faker::Lorem.sentence}
    user { FactoryGirl.create(:user, name:"abcdef")}
  end
end
