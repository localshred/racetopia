class AddSubscribedToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :subscribed, :boolean, :default => true
  end

  def self.down
    remove_column :users, :subscribed
  end
end
