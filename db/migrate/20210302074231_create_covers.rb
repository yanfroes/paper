class CreateCovers < ActiveRecord::Migration[6.0]
  def change
    create_table :covers do |t|
      t.references :edition, null: false, foreign_key: true
      t.string :pic

      t.timestamps
    end
  end
end
