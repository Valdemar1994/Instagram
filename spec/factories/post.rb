FactoryBot.define do
  factory :post do
    association :user
    description { FFaker::Lorem.sentence }

    trait :with_image do
      image { Rack::Test::UploadedFile.new(Rails.root.join('spec/support/assets/test-image.jpg')) }
    end
    trait :with_long_post do
      comment { FFaker::Lorem.paragraphs }
    end

  end
end
