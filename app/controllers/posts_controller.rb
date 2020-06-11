class PostsController < ApplicationController
  def index
    @posts = policy_scope(Post).all
  end

  def new
    @post = Post.new
    authorize @post
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def create
    @post = Post.new(post_params)
    authorize @post
    if @post.save
      redirect_to post_path(index)
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end
end
