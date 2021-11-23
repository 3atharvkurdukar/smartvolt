class CreateConnections < ActiveRecord::Migration[6.1]
  def change
    create_table :connections do |t|
      t.string :name
      t.string :address
      t.string :type
      t.integer :phase
      t.float :rate
      t.string :area
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
