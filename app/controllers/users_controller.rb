class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
  	@followings = @user.followings
  	@followers = @user.followers
  end

end
