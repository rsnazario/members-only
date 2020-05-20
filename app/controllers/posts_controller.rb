class PostsController < ApplicationController
  def index
    @get_posts = Post.all.order('created_at DESC')
  end

  def show
    # comes from devise helper
  end

  # CREATE POST
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    redirect_to post_path(@post)
  end

  # EDIT POST
  def edit
    @article = Article.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update(post_params)
    redirect_to post_path(@post)
  end

  # DELETE POST
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to post_path(@post)
  end

  # HELPERS
  private
  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  # def set_post
  #   @post = Post.find(params[:id])
  # end
end
