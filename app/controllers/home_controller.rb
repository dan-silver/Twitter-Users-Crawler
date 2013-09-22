class HomeController < ApplicationController
  def index
    @followers = User.find(params[:uid]).fetchFollowers
  end
end