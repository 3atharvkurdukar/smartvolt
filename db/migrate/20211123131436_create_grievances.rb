class CreateGrievances < ActiveRecord::Migration[6.1]
  def change
    create_table :grievances do |t|
      t.string :problem
      t.string :description
      t.string :remarks
      t.string :status
      t.references :connection, null: false, foreign_key: true
      t.references :official, null: false, foreign_key: true

      t.timestamps
    end
  end
end
