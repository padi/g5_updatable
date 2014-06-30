class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :uid
      t.string :name
      t.boolean :corporate
      t.string :urn
      t.string :state
      t.string :city
      t.string :street_address
      t.string :postal_code
      t.string :domain
      t.string :city_slug
      t.string :phone_number
      t.string :neighborhood
      t.string :primary_amenity
      t.string :primary_landmark
      t.string :qualifier
      t.string :floor_plans

      t.timestamps
    end
  end
end
