class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.string :uid
      t.string :name
      t.string :vertical
      t.string :type
      t.string :domain

      t.timestamps
    end
  end
end
