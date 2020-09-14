class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.integer :book_id, :null => false
      t.string :book_title, :null => false

      t.timestamps
    end
  end
end
