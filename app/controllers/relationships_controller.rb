class RelationshipsController < ApplicationController

  # before_action :set_user

  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
    if follow.save
      flash[:notice] = "フォローしました"
      redirect_back(fallback_location: root_path)
    else
      flash[:alert] = "フォローできませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    flash[:notice] = "フォローを解除しました"
    redirect_back(fallback_location: root_path)
  end

  # def set_user
  #   @user = User.find(params[:user_id])
  # end

end
