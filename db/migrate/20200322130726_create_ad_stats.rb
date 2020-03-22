# frozen_string_literal: true

class CreateAdStats < ActiveRecord::Migration[6.0]
  def change
    create_table :ad_stats do |t|
      t.references :ad, null: false, foreign_key: true
      t.date :date, null: false
      t.integer :loads, null: false, default: 0
      t.integer :clicks, null: false, default: 0

      t.timestamps
    end
    add_index :ad_stats, %i[ad_id date], unique: true
  end
end
