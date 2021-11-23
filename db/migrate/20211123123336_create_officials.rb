class CreateOfficials < ActiveRecord::Migration[6.1]
  def change
    create_table :officials do |t|
      t.string :name
      t.string :username
      t.string :password_digest
      t.string :area

      t.timestamps
    end
  end
end
