class DropTwitterUsers < ActiveRecord::Migration
  def up
  	drop_table :twitter_users
  end

  def down
  end
end
