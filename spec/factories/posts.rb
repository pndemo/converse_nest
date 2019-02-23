FactoryBot.define do
  factory :post do
    title { Faker::Lorem.word }
    content { Faker::Lorem.paragraph }
    created_by { Faker::Name.name }
  end
end
