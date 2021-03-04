class CreateIsbns < ActiveRecord::Migration[6.0]
  def change
    create_table :isbns do |t|
      t.references :book, null: false, foreign_key: true
      t.string :number

      t.timestamps
    end
  end
end
