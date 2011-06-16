class CreateGames < ActiveRecord::Migration
  def self.up
    create_table :games do |t|
      t.datetime :game_time
      t.text :location
      t.datetime :polling_cutoff
      t.integer :min_players

      t.timestamps
    end
  end

  def self.down
    drop_table :games
  end
end
