class AddPhotoToFarms < ActiveRecord::Migration[5.2]
  def change
    add_column :farms, :photo, :string
  end
end
