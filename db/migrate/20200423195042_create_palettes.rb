class CreatePalettes < ActiveRecord::Migration[6.0]
  def change
    create_table :palettes do |t|
      t.belongs_to :pattern, null: false, foreign_key: true

      t.timestamps
    end
  end
end
