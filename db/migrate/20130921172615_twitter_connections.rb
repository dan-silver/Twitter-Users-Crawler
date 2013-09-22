class TwitterConnections < ActiveRecord::Migration
  def up
  	create_table "twitterConnections", :force => true, :id => false do |t|
	  t.integer "twitterUser_a_id", :null => false
	  t.integer "twitterUser_b_id", :null => false
	end
  end

  def down
  	drop_table :twitterConnections
  end
end
