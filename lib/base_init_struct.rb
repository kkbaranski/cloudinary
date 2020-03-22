# frozen_string_literal: true

class BaseInitStruct
  class << self
    attr_accessor :acceptable_args
  end

  self.acceptable_args = []

  def initialize(**args)
    if self.class.acceptable_args.is_a? Array
      generate_args_for_array(args)
    elsif self.class.acceptable_args.is_a? Hash
      generate_args_for_hash(args)
    end
  end

  private

  def generate_args_for_array(args)
    self.class.acceptable_args.each do |name|
      instance_variable_set("@#{name}", args[name])
    end
  end

  def generate_args_for_hash(args)
    self.class.acceptable_args.each do |name, value|
      instance_variable_set("@#{name}", args[name].nil? ? value : args[name])
    end
  end
end
