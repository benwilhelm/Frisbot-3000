class AddMapLinkToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :map_link, :string
  end

  def self.down
    remove_column :games, :map_link
  end
end
