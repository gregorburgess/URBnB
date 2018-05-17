class CreateFarms < ActiveRecord::Migration[5.2]
  def change
    create_table :farms do |t|
      t.string :name
      t.string :location
      t.text :description
      t.string :country
      t.string :city
      t.integer :price
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
