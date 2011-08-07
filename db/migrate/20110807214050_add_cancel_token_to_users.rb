class AddCancelTokenToUsers < ActiveRecord::Migration
  
  require "digest"

  def self.up
    add_column :users, :cancel_token, :string
    User.find(:all).each do |usr|
      raw = RandSmartPass(6)
      tkn = Digest::SHA1.hexdigest(raw)
      usr.cancel_token = tkn
      usr.save 
    end
  end

  def self.down
    remove_column :users, :cancel_token
  end
end
