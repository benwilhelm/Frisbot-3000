class PlayerIdToUserId < ActiveRecord::Migration
  def self.up
    rename_column :rsvps, :player_id, :user_id
  end

  def self.down
    rename_column :rsvps, :user_id, :player_id
  end
end
