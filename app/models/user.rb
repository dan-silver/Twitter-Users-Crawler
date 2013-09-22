include ApplicationHelper
class User < ActiveRecord::Base
  attr_accessible :provider, :uid, :name, :email, :followers
  validates_presence_of :name
  has_and_belongs_to_many(:followers,
    :class_name => "User",
    :join_table => "twitterConnections",
    :foreign_key => "twitterUser_a_id",
    :association_foreign_key => "twitterUser_b_id")

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth['provider']
      user.uid = auth['uid']
      if auth['info']
        user.name = auth['info']['name'] || ""
        user.email = auth['info']['email'] || ""
      end
    end
  end

  def self.create_from_twitter(info)
  	puts info
    create! do |u|
      u.uid = info.id
      u.name = info.name
      u.screen_name = info.screen_name
      u.profile_image_url = info.profile_image_url.to_s
    end
  end

  def getFollowers
    client.followers(self.uid.to_i).take(20).to_a.each do |follower|
      a = User.where(:uid => follower.id).first || User.create_from_twitter(follower)
      self.followers << a unless self.followers.include? a
    end
  end

  def fetchFollowers
  	if self.followers.length < 20
  		self.getFollowers
  	end
  	self.followers
	end
end