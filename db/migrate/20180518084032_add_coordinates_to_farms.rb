class AddCoordinatesToFarms < ActiveRecord::Migration[5.2]
  def change
    add_column :farms, :latitude, :float
    add_column :farms, :longitude, :float
  end
end
