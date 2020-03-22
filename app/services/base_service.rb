# frozen_string_literal: true

# Provides class to inherit services from
class BaseService < BaseInitStruct
  # include ActionView::Helpers::NumberHelper
  attr_accessor :answer

  def initialize(**args)
    super(args)
    @answer = ServiceAnswer.new
  end

  def call
    raise NotImplementedError
  end
end
