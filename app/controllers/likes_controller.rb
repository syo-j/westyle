class LikesController < ApplicationController

	before_action :set_variables

	def create
		@like = current_user.likes.create(post_id: params[:post_id])
    	# redirect_back(fallback_location: root_path)
	end

	def destroy
		@like = Like.find_by(post_id: params[:post_id], user_id: current_user.id)
    	@like.destroy
    	# redirect_back(fallback_location: root_path)
	end

	def set_variables
		@post = Post.find(params[:post_id])
	end
end
