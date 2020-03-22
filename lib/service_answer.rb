# frozen_string_literal: true

class ServiceAnswer < BaseInitStruct
  attr_accessor :success, :data, :error

  self.acceptable_args = { success: true, data: nil, error: false }

  def success?
    @success
  end

  def fail(error = true)
    self.success = false
    self.error = error

    self
  end

  def fail!(error = true)
    self.fail(error)
    raise error
  end

  def with_data(data)
    self.data = data
    self
  end
end
