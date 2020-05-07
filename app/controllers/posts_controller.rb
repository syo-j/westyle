class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  impressionist :actions => [:show]

  def index
    @posts = Post.all.order("created_at DESC").page(params[:post_page]).per(6)

    @set_posts = Post.all
    # shopのみ,userのみ
    @shop_posts = []
    @user_posts = []
    @set_posts.each do |post|
      if post.shop_id.present?
        @shop_posts << post
      else
        @user_posts << post
      end
    end
    @shop_posts_sort = @shop_posts.sort_by {|f| f.created_at}.reverse
    @shop_posts_sort = Kaminari.paginate_array(@shop_posts_sort).page(params[:page]).per(9)
    @user_posts_sort = @user_posts.sort_by {|f| f.created_at}.reverse
    @user_posts_sort = Kaminari.paginate_array(@user_posts_sort).page(params[:page]).per(9)
    
    # タイムライン表示
    @followings =[]
    if user_signed_in?
      current_user.followings.each do |following|
        following.posts.each do |post| 
          @followings << post
        end
      end
    end
    @followings_sort = @followings.sort_by {|f| f.created_at}.reverse
    # arrayエラーの場合
    @followings_sort = Kaminari.paginate_array(@followings_sort).page(params[:page]).per(3)
  end


  def show  
    
    @post = Post.find(params[:id])
    @clothes = @post.clothes.all

    # 過去の投稿
    @posts = @post.user.posts.all

    # 同じブランドの投稿
    @clothe_all = Clothe.all
    @clothe_post = @post.clothes.all
    @bland_posts = []
    @clothe_post.each do |post_clothe|
      @clothe_all.each do |clothe|
        if clothe.bland == post_clothe.bland
          @bland_posts << clothe.post
        end
      end
    end
    
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
      flash[:notice] = "入力を保存しました"
      redirect_to new2_post_path(@post)
    else
      flash[:alert] = "保存できませんでした"
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
      flash[:notice] = "入力を更新しました。"
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
    @q = Post.ransack(params[:q])
    @post_images = @q.result(distinct: true).page(params[:page]).per(30)
  end

  def new2
    @post = Post.find(params[:id])
    @clothe = @post.clothes.new
    @clothes = @post.clothes.all

    @categories = Category.all

  end



  private

  def post_params
    params.require(:post).permit(
      :title, :content, :image, :video, :shop_gender, :shop_height
      )
  end

  def update_post_params
    params.require(:post).permit(
      :title, :content, :image, :video, :shop_gender, :shop_height
      )
  end

end
