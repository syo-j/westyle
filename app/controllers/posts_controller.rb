class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  impressionist :actions => [:show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = @post.comments.new
    @comments = @post.comments
    @commented_users = @post.commented_users
    impressionist(@post, "message...") # 2nd argument is optional
  end

  def new
    @post = Post.new
    @post.clothes.build
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # user_idを持ったshopの子を持つuserなら
    unless current_user.shop.blank?
      @post.shop_id = current_user.shop.id
    end
    if @post.save
      flash[:notice] = "投稿しました"
      redirect_to posts_path
    else
      flash[:alert] = "投稿できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def edit
    @post = Post.find(params[:id])
    
  end

  def update
    @post = Post.find(params[:id])
    @post.update (update_post_params)
    if @post.save
      flash[:notice] = "更新しました"
      redirect_to posts_path
    else
      flash[:alert] = "更新できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:success] = "投稿を削除しました"
    redirect_to posts_path
  end

  def search
    puts "---------------------"
    puts Post.ransackable_associations
    puts "---------------------"
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @post_images = @q.result(distinct: true)
  end


  

  private

  def post_params
    params.require(:post).permit(
      :title, :content, :image,
      clothes_attributes: [
        :bland_id, :category_id, :size_id, :color_id, :price, :name
      ])
  end

  def update_post_params
    params.require(:post).permit(
      :title, :content, :image,
      clothes_attributes: [
        :bland_id, :category_id, :size_id, :color_id,
        :price, :name, :_destroy, :id
      ])
  end

end
