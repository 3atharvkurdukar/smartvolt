class AddEmpIdToOfficial < ActiveRecord::Migration[6.1]
  def change
    add_column :officials, :emp_id, :string
  end
end
