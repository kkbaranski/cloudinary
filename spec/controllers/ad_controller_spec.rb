# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdsController, type: :controller do
  describe 'GET #index' do
    it 'returns http success' do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET show/:id' do
    it 'should redirect to ad url' do
      ad = create(:ad)
      get :show, params: { id: ad.id }
      expect(response).to redirect_to(ad.url)
    end
  end
end
