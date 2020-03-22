# frozen_string_literal: true

module AdHelper
  def track_ad_load(adv)
    Ads::TrackEventService.new(**{ ad: adv, event_name: :loads }).call
  end
end
