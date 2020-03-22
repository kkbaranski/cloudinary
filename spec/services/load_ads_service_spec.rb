# frozen_string_literal: true

require 'rails_helper'

RSpec.describe LoadAdsService, type: :service do
  let(:ads_uniq) do
    {
      'ad1': 'http://url1.com',
      'ad2': 'http://url2.com',
      'ad3': 'http://url3.com'
    }
  end

  let(:ads_not_uniq) do
    {
      'ad1': 'http://url1.com',
      'ad2': 'http://url2.com',
      'ad1': 'http://url3.com' # rubocop:disable Lint/DuplicateHashKey
    }
  end

  context 'with uniq ad names' do
    subject { described_class.new(ads: ads_uniq) }

    it { expect(subject.call).to be_success }
    it { expect { subject.call }.to change(Ad, :count).by(3) }
  end

  context 'with not uniq ad names' do
    subject { described_class.new(ads: ads_not_uniq) }

    it { expect(subject.call).to be_success }
    it { expect { subject.call }.to change(Ad, :count).by(2) }
    it 'should override duplicates' do
      subject.call
      expect(Ad.find_by(name: 'ad1').url).to eq('http://url3.com')
    end
  end
end
