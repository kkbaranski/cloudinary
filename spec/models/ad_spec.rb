# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ad, type: :model do
  subject! { create :ad_with_stats, from: Date.new(2020, 3, 1), to: Date.new(2020, 3, 5) }

  describe 'associations' do
    it { is_expected.to have_many(:ad_stats).dependent(:destroy) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'destroying' do
    it { expect { subject.destroy }.to change(Ad, :count).by(-1) }
    it { expect { subject.destroy }.to change(AdStats, :count).by(-5) }
    it { expect { subject.destroy }.to_not raise_error }
    it { expect(subject.destroy).to be_truthy }
  end
end
