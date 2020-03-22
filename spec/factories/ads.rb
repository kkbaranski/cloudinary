# frozen_string_literal: true

FactoryBot.define do
  factory :ad do
    sequence(:name) { |n| "ad#{n}" }
    url { Faker::Internet.url }

    trait :with_stats do
      transient do
        from { Time.zone.today.to_date }
        to { Time.zone.today.to_date }
      end

      after(:create) do |ad, e|
        (e.from.to_date..e.to.to_date).each do |date|
          create :ad_stats, date: date, ad: ad
        end
      end
    end

    factory :ad_with_stats, traits: [:with_stats]
  end
end
