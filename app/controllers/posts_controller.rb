class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  impressionist :actions => [:show]

  def index
    @posts = Post.all

  #   @posts.each do |post|
  #     post.current_user.followers.each do |follower| 
  #       if follower.id == post.user_id
  # 　　    @post_followers = follower.posts
  #       end
  #     end
  #   end

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
    
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    # user_idを持ったshopの子を持つuserなら
    unless current_user.shop.blank?
      @post.shop_id = current_user.shop.id
    end
    if @post.save
      flash[:notice] = "保存しました"
      redirect_to new2_post_path(@post)
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
    @post.update(update_post_params)
    if @post.save
      flash[:notice] = "更新しました。"
      redirect_to new2_post_path(@post)
    else
      flash[:alert] = "更新できませんでした"
      redirect_back(fallback_location: root_path)
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "投稿を削除しました"
    redirect_back(fallback_location: root_path)
  end

  def search
    @posts = Post.all
    @q = Post.ransack(params[:q])
    @post_images = @q.result(distinct: true)
  end

  def new2
    @post = Post.find(params[:id])
    @clothe = @post.clothes.new

    @clothes = @post.clothes

    @colors = @post.colored_posts.all
    @blands = @post.blanded_posts.all
    @categories = @post.categoryed_posts.all
    @sizes =  @post.sized_posts.all
  end



  private

  def post_params
    params.require(:post).permit(
      :title, :content, :image, :shop_gender, :shop_height
      )
  end

  def update_post_params
    params.require(:post).permit(
      :title, :content, :image, :shop_gender, :shop_height
      )
  end

end
