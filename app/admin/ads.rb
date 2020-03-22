# frozen_string_literal: true

ActiveAdmin.register Ad do
  permit_params :name, :url

  index do
    id_column
    column :name
    column :url
    column :all_loads do |ad|
      ad.ad_stats.pluck(:loads).sum
    end
    column :all_clicks do |ad|
      ad.ad_stats.pluck(:clicks).sum
    end
    actions
  end

  action_item only: :index do
    link_to 'Load ads', action: 'upload_excel'
  end

  collection_action :upload_excel do
    uri = URI(Settings.ad_provider_url)
    response = Net::HTTP.get(uri)
    ads = JSON.parse(response)
    answer = LoadAdsService.new(**{ ads: ads }).call
    redirect_to collection_path, notice: "#{answer.data.size} ads have been imported."
  end
end
