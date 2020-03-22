# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ads::StatsReportService, type: :service do
  let(:ad1) { create :ad }
  let(:ad2) { create :ad }
  let(:ad3) { create :ad }

  before do
    create :ad_stats, ad: ad1, loads: 1, clicks: 2, date: 2.days.ago
    create :ad_stats, ad: ad1, loads: 3, clicks: 4, date: 1.day.ago
    create :ad_stats, ad: ad1, loads: 5, clicks: 6

    create :ad_stats, ad: ad2, loads: 7, clicks: 8, date: 2.days.ago
    create :ad_stats, ad: ad2, loads: 9, clicks: 8, date: 1.day.ago
    create :ad_stats, ad: ad2, loads: 7, clicks: 6

    create :ad_stats, ad: ad3, loads: 5, clicks: 4, date: 2.days.ago
    create :ad_stats, ad: ad3, loads: 3, clicks: 2, date: 1.day.ago
  end

  let(:expected_today) do
    [
      { name: ad1.name, url: ad1.url, loads: 5, clicks: 6 },
      { name: ad2.name, url: ad2.url, loads: 7, clicks: 6 },
      { name: ad3.name, url: ad3.url, loads: 0, clicks: 0 }
    ]
  end

  let(:expected_1_day_ago) do
    [
      { name: ad1.name, url: ad1.url, loads: 3, clicks: 4 },
      { name: ad2.name, url: ad2.url, loads: 9, clicks: 8 },
      { name: ad3.name, url: ad3.url, loads: 3, clicks: 2 }
    ]
  end

  let(:expected_2_days_ago) do
    [
      { name: ad1.name, url: ad1.url, loads: 1, clicks: 2 },
      { name: ad2.name, url: ad2.url, loads: 7, clicks: 8 },
      { name: ad3.name, url: ad3.url, loads: 5, clicks: 4 }
    ]
  end

  let(:expected_3_days_ago) do
    [
      { name: ad1.name, url: ad1.url, loads: 0, clicks: 0 },
      { name: ad2.name, url: ad2.url, loads: 0, clicks: 0 },
      { name: ad3.name, url: ad3.url, loads: 0, clicks: 0 }
    ]
  end

  shared_examples 'valid report' do |date, expected|
    subject { described_class.new(date: date) }

    it { expect(subject.call).to be_success }
    it { expect(subject.call.data).to include(*send(expected)) }
  end

  it_behaves_like 'valid report', Time.zone.today, :expected_today
  it_behaves_like 'valid report', 1.day.ago, :expected_1_day_ago
  it_behaves_like 'valid report', 2.days.ago, :expected_2_days_ago
  it_behaves_like 'valid report', 3.days.ago, :expected_3_days_ago

  context 'invalid date' do
    subject { described_class.new(date: '2020-34-03') }

    it { expect(subject.call).to_not be_success }
  end
end
