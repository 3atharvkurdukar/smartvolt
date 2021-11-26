class ChangeTypeToConnType < ActiveRecord::Migration[6.1]
  def change
    rename_column :connections, :type, :conn_type
  end
end
