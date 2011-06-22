class CreatePlayers < ActiveRecord::Migration
  def self.up
    drop_table :players
    create_table :players do |t|
      t.string :fname
      t.string :lname
      t.string :email
      t.string :role
      t.string :password

      t.timestamps
    end
  end

  def self.down
    drop_table :players
  end
end
