class AddFieldstoUser < ActiveRecord::Migration
  def up
  	add_column :users, :screen_name, :string
  	add_column :users, :profile_image_url, :string
  end

  def down
  end
end
