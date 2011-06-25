class ChangeRespToBoolean < ActiveRecord::Migration
  def self.up
    change_table :rsvps do |t|
      t.change :resp, :boolean
    end
  end

  def self.down
    change_table :rsvps do |t|
      t.change :resp, :text
    end
  end
end
