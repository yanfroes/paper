class CreateIsbns < ActiveRecord::Migration[6.0]
  def change
    create_table :isbns do |t|
      t.integer :book_id
      t.string :number

      t.timestamps
    end
  end
end
