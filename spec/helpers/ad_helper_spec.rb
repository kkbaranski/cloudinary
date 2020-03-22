# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdHelper, type: :helper do
  let!(:ad) { create :ad }
  let!(:ad_with_todays_stats) { create :ad_with_stats }

  describe '#track_ad_load' do
    subject { helper.track_ad_load }

    context 'with no stats' do
      it { expect { helper.track_ad_load(ad) }.to change(AdStats, :count).by(1) }
    end

    context 'with todays stats' do
      it { expect { helper.track_ad_load(ad_with_todays_stats) }.to_not change(AdStats, :count) }
    end
  end
end
