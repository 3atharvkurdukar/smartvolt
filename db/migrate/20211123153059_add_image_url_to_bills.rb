class AddImageUrlToBills < ActiveRecord::Migration[6.1]
  def change
    add_column :bills, :image_url, :string
  end
end
