# frozen_string_literal: true

FactoryBot.define do
  factory :ad do
    sequence(:name) { |n| "ad#{n}" }
    url { Faker::Internet.url }
  end
end
