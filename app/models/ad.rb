# frozen_string_literal: true

class Ad < ApplicationRecord
  #======================================= Validations ========================================#
  validates :name, presence: true, uniqueness: true
  validates :url,  presence: true, format: { with: URI.regexp(%w[http https]) }
end
