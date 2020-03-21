# frozen_string_literal: true

require 'webmock'

class ApplicationController < ActionController::Base
  include WebMock::API

  WebMock.enable!

  WebMock.stub_request(:any, Settings.ad_provider_url).
    to_return { { body: JSON.generate(Faker::Lorem.word => Faker::Internet.url) } }
end
