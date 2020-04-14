class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:setting]
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all
  	@followers = @user.followers
    @followings = @user.followings
  	@staffs = @user.registerings
    
  	@posts.each do |post|
  		impressionist(post, "message...") # 2nd argument is optional
  	end
  end


  def setting
    @user = User.find_by(id: current_user.id)
    @posts = @user.posts.all
    @followings = @user.followings
    @followers = @user.followers
    @staffs = @user.registerings
    
    @posts.each do |post|
      impressionist(post, "message...") # 2nd argument is optional
    end
  end

end
