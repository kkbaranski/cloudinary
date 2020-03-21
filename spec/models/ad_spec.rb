# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ad, type: :model do
  subject! { create :ad }

  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_uniqueness_of(:name) }

    it { is_expected.to validate_presence_of(:url) }
  end

  describe 'destroying' do
    it { expect { subject.destroy }.to change(Ad, :count).by(-1) }
    it { expect { subject.destroy }.to_not raise_error }
    it { expect(subject.destroy).to be_truthy }
  end
end
