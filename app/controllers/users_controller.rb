class UsersController < ApplicationController
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
  	@followings = @user.followings
  	@followers = @user.followers
  	@staffs = @user.registereds
  	@posts.each do |post|
  		impressionist(post, "message...") # 2nd argument is optional
  	end

  end

end
