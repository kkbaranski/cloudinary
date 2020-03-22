# frozen_string_literal: true

class AdsController < ApplicationController
  before_action :set_ad, only: :show
  def index
    @ads = Ad.all
  end

  def show
    Ads::TrackEventService.new(**{ ad: @ad, event_name: :clicks }).call
    redirect_to(@ad.url) && return
  end

  private

  def set_ad
    @ad = Ad.find(params[:id])
  end
end
