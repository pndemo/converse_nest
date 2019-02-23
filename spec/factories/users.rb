FactoryBot.define do
  factory :user do
    name { Faker::Name.name }
    email { "foobar@example.com" }
    password_digest { "strongpass" }
  end
end
