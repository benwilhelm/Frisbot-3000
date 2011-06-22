class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.integer :player
      t.integer :game
      t.string :resp
      t.string :auth_token

      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end
