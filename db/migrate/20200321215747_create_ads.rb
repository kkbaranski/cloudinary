# frozen_string_literal: true

class CreateAds < ActiveRecord::Migration[6.0]
  def change
    create_table :ads do |t|
      t.string :name, null: false
      t.string :url

      t.timestamps
    end
    add_index :ads, :name, unique: true
  end
end
