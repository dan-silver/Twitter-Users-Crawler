class CreateTwitterUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :name
      t.string :screen_name
      t.string :location
      t.integer :twitterId
      t.string :url
      t.string :profile_image_url

      t.timestamps
    end
  end
end
