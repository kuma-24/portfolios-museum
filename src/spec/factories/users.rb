FactoryBot.define do
  factory :user do
    name { Faker::Internet.username(specifier: 1..50) }
    email { Faker::Internet.free_email }
    password { '123abc' }
    password_confirmation { password }
  end
end
