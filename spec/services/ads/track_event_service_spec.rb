# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ads::TrackEventService, type: :service do
  let(:ad) { create :ad }
  let(:ad_with_todays_stats) { create :ad_with_stats }

  shared_examples 'track event' do |event_name|
    context 'with no stats' do
      subject { described_class.new(ad: ad, event_name: event_name) }

      it { expect(subject.call).to be_success }
      it { expect { subject.call }.to change(AdStats, :count).by(1) }
      it { expect(subject.call.data).to eq(1) }
      it "should set column #{event_name} in todays AdStats to 1" do
        subject.call
        expect(ad.todays_stats.send(event_name)).to eq(1)
      end
    end

    context 'with todays stats' do
      subject! { described_class.new(ad: ad_with_todays_stats, event_name: event_name) }

      it { expect(subject.call).to be_success }
      it { expect { subject.call }.to_not change(AdStats, :count) }
      it "should increment column #{event_name} in todays AdStats by 1" do
        prev_stats = ad_with_todays_stats.todays_stats.send(event_name)
        subject.call
        expect(ad_with_todays_stats.todays_stats.send(event_name)).to eq(prev_stats + 1)
      end
    end
  end

  it_behaves_like 'track event', :loads
  it_behaves_like 'track event', :clicks
end
