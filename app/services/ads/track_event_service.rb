# frozen_string_literal: true

module Ads
  class TrackEventService < BaseService
    self.acceptable_args = %i[ad event_name]

    def call
      todays_stats = @ad.todays_stats
      AdStats.increment_counter(@event_name, todays_stats.id, touch: true) # rubocop:disable Rails/SkipsModelValidations
      @answer.with_data(todays_stats.reload.send(@event_name))
    end
  end
end
