class DropClientsAndLocations < ActiveRecord::Migration
  def up
    drop_table :clients
    drop_table :locations
  end

  def down
    raise ActiveRecord::IrreversibleMigration.new("Nooooope")
  end
end
