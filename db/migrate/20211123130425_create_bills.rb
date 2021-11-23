class CreateBills < ActiveRecord::Migration[6.1]
  def change
    create_table :bills do |t|
      t.integer :prev_reading
      t.integer :curr_reading
      t.integer :units
      t.float :amount
      t.string :status
      t.references :connection, null: false, foreign_key: true
      t.references :official, null: false, foreign_key: true

      t.timestamps
    end
  end
end
