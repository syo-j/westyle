class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]


  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @like = Like.new
    @comment = @post.comments.build
    @commented_users = @post.commented_users
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
    @post.update (post_params)
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
    params.require(:post).permit(:title, :content, :image)
  end

end
