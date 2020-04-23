class CreatePaletteColors < ActiveRecord::Migration[6.0]
  def change
    create_table :palette_colors do |t|
      t.belongs_to :palette, null: false, foreign_key: true
      t.belongs_to :color, null: false, foreign_key: true

      t.timestamps
    end
  end
end
