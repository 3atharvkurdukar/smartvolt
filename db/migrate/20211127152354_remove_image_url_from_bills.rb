class RemoveImageUrlFromBills < ActiveRecord::Migration[6.1]
  def change
    remove_column :bills, :image_url, :string
  end
end
