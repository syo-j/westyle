class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:setting]
  def show
  	@user = User.find(params[:id])
  	@posts = @user.posts.all.page(params[:user_post_page]).per(12)
    @likes = @user.liked_posts.all.page(params[:like_post_page]).per(12)
  	@followers = @user.followers
    @followings = @user.followings
  	@staffs = @user.registerings
    
  	
  end


  def setting
    @user = User.find_by(id: current_user.id)
    @posts = @user.posts.all
    @followings = @user.followings
    @followers = @user.followers
    @staffs = @user.registerings
    
  
  end

end
