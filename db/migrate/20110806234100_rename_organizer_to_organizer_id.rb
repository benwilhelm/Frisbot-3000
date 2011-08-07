class RenameOrganizerToOrganizerId < ActiveRecord::Migration
  def self.up
    rename_column :games, :organizer, :organizer_id
  end

  def self.down
    rename_column :games, :organizer_id, :organizer
  end
end
