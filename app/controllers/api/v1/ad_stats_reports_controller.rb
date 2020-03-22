# frozen_string_literal: true

module Api
  module V1
    class AdStatsReportsController < ApplicationController
      before_action :authenticate

      def index
        answer = Ads::StatsReportService.new(**{ date: params[:date] }).call
        render(body: answer.error, status: :bad_request) && return unless answer.success?
        render json: answer.data.to_json, status: :ok
      end

      private

      def authenticate
        authenticate_or_request_with_http_token do |token, _options|
          ActiveSupport::SecurityUtils.secure_compare(token, Settings.api_token)
        end
      end
    end
  end
end
