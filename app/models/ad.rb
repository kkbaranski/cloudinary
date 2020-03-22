# frozen_string_literal: true

class Ad < ApplicationRecord
  #======================================= Associations =======================================#
  has_many :ad_stats, dependent: :destroy

  #======================================= Validations ========================================#
  validates :name, presence: true, uniqueness: true
  validates :url,  presence: true, format: { with: URI.regexp(%w[http https]) }

  def todays_stats
    ad_stats.find_or_create_by(date: Time.zone.today.to_date)
  end
end
