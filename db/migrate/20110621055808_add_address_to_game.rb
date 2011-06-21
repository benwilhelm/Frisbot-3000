class AddAddressToGame < ActiveRecord::Migration
  def self.up
    add_column :games, :address, :text
    change_column :games, :location, :string
  end

  def self.down
    remove_column :games, :address
    change_column :games, :location, :text
  end
end
