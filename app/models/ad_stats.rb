# frozen_string_literal: true

class AdStats < ApplicationRecord
  #======================================= Associations =======================================#
  belongs_to :ad

  #======================================= Validations ========================================#
  validates :date, presence: true, uniqueness: { scope: :ad }
  validates :loads, :clicks, presence: true
end
