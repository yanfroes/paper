class CreateEditions < ActiveRecord::Migration[6.0]
  def change
    create_table :editions do |t|
      t.references :book, null: false, foreign_key: true
      t.string :name

      t.timestamps
    end
  end
end
