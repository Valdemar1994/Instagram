FactoryBot.define do
  factory :comment do
    association :user
    association :post
    comment { FFaker::Lorem.sentence }
    
    trait :with_long_comment do
      comment { FFaker::Lorem.paragraph }
    end
  end
end
