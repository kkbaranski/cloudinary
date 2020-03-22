# frozen_string_literal: true

FactoryBot.define do
  factory :ad_stats do
    ad
    date { Time.zone.today.to_date }
    loads { Faker::Number.between(from: 0, to: 1000) }
    clicks { Faker::Number.between(from: 0, to: 1000) }
  end
end
