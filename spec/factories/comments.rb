FactoryBot.define do
  factory :comment do
    content { Faker::Lorem.paragraph }
    created_by { Faker::Name.name }
    post { nil }
  end
end
