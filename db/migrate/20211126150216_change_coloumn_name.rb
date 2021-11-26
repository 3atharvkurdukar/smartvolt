class ChangeColoumnName < ActiveRecord::Migration[6.1]
  def change
    rename_column :connections, :type, :connection_type
  end
end
