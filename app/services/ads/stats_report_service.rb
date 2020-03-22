# frozen_string_literal: true

module Ads
  class StatsReportService < BaseService
    self.acceptable_args = %i[date]

    def call
      @date ||= Time.zone.today
      report = Ad.joins(join_query(@date)).select(select_query).map do |ad|
        {
          name: ad.name,
          url: ad.url,
          loads: ad.loads || 0,
          clicks: ad.clicks || 0
        }
      end
      @answer.with_data(report)
    rescue Date::Error => e
      @answer.fail(e.message)
    end

    private

    def join_query(date)
      %{
        LEFT OUTER JOIN (
          SELECT *
          FROM ad_stats
          WHERE date = '#{date.to_date}'
        )
        AS ad_stats
        ON ads.id = ad_stats.ad_id
      }
    end

    def select_query
      %(
        ads.name,
        ads.url,
        ad_stats.loads,
        ad_stats.clicks
      )
    end
  end
end
