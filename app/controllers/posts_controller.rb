class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show new create]

  def index
    @post = Post.all.order('created_at DESC')
  end

  def show
    # comes from devise helper
  end

  # CREATE POST
  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    redirect_to posts_path
  end

  # EDIT POST
  def edit
    # comes from devise helper
  end

  def update
    @post.update(post_params)
    redirect_to root_path
  end

  # DELETE POST
  def destroy
    @post.destroy
    redirect_to root_path
  end

  # HELPERS
  private

  def post_params
    params.require(:post).permit(:title, :body, :user_id)
  end

  def set_post
    @post = current_user.posts.find(params[:id])
  end
end
