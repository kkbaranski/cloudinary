# frozen_string_literal: true

require 'webmock'

class ApplicationController < ActionController::Base
  include WebMock::API

  WebMock.enable!

  WebMock.stub_request(:any, Settings.ad_provider_url).to_return do
    {
      body: JSON.generate(
        10.times.map { |_n| [Faker::Lorem.word, Faker::Internet.url] }.to_h
      )
    }
  end
end
