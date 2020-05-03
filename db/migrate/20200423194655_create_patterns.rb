class CreatePatterns < ActiveRecord::Migration[6.0]
  def change
    create_table :patterns do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.string :name
      t.text :image
      t.integer :size

      t.timestamps
    end
  end
end
