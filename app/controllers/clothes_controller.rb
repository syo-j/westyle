class ClothesController < ApplicationController
  	
	def create
		@post = Post.find(params[:post_id])
    	@clothe = @post.clothes.new(clothe_params)
    	
		if @clothe.save
			flash[:notice] = "保存しました"
			redirect_to new2_post_path(@post)
		else
			flash[:alert] = "保存できませんでした"
			redirect_back(fallback_location: root_path)
		end
	end

	def destroy
    	@clothe = Clothe.find_by(
    		id: params[:id]
    	)
		@clothe.destroy
		flash[:notice] = "アイテムを削除しました"
		redirect_back(fallback_location: root_path)
	end


	private


	def clothe_params
	    params.require(:clothe).permit(
	        :bland, :category_id, :size_id, :color_id, :price, :name
	      )
	end


end
