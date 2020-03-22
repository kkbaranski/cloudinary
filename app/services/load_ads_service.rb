# frozen_string_literal: true

class LoadAdsService < BaseService
  self.acceptable_args = %i[ads]

  def call
    params = @ads.map do |name, url|
      {
        name: name,
        url: url,
        created_at: Time.zone.now,
        updated_at: Time.zone.now
      }
    end
    result = Ad.insert_all(params, returning: [:name], unique_by: :name)
    @answer.with_data(result.rows.flatten)
  end
end
