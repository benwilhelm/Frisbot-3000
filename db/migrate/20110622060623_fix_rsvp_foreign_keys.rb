class FixRsvpForeignKeys < ActiveRecord::Migration
  def self.up
    rename_column :rsvps, :game, :game_id
    rename_column :rsvps, :player, :player_id
  end

  def self.down
    rename_column :rsvps, :game_id, :game
    rename_column :rsvps, :player_id, :player
  end
end
