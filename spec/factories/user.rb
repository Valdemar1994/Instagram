FactoryBot.define do
  factory :user do
    email                   { FFaker::Internet.email }
    name                    { FFaker::Name.name }
    username                { FFaker::Internet.user_name }
    password                { 'password' }
    password_confirmation   { 'password' }
  end
end
