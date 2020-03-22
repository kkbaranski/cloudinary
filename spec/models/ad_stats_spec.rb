# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AdStats, type: :model do
  subject! { create :ad_stats }

  describe 'associations' do
    it { is_expected.to belong_to(:ad) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:date) }
    it { is_expected.to validate_presence_of(:loads) }
    it { is_expected.to validate_presence_of(:clicks) }
    # it { is_expected.to validate_uniqueness_of(:date).scoped_to(:ad) }
    it 'should validate_uniqueness_of(:date).scoped_to(:ad)' do
      ad = create :ad
      create :ad_stats, date: Date.new(2020, 3, 1), ad: ad

      expect do
        create :ad_stats, date: Date.new(2020, 3, 1), ad: ad
      end.to raise_error(ActiveRecord::RecordInvalid)
    end
  end

  describe 'destroying' do
    it { expect { subject.destroy }.to change(AdStats, :count).by(-1) }
    it { expect { subject.destroy }.to_not change(Ad, :count) }
    it { expect { subject.destroy }.to_not raise_error }
    it { expect(subject.destroy).to be_truthy }
  end
end
