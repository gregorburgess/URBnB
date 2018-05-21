class RenameLocationFromFarms < ActiveRecord::Migration[5.2]
  def change
    rename_column :farms, :location, :address
  end
end
