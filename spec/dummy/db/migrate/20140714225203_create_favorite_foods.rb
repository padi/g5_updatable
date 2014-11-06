class CreateFavoriteFoods < ActiveRecord::Migration
  def change
    create_table :favorite_foods do |t|
      t.string :name
      t.string :location_uid

      t.timestamps
    end
  end
end
