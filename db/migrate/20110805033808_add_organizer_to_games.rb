class AddOrganizerToGames < ActiveRecord::Migration
  def self.up
    add_column :games, :organizer, :int
  end

  def self.down
    remove_column :games, :organizer
  end
end
