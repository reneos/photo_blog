class PostsController < ApplicationController

  def index
    @posts = policy_scope(Post).published
    @drafts = policy_scope(Post).not_published
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def upload_image
    blob = ActiveStorage::Blob.create_after_upload!
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      redirect_to edit_post_path(@post)
    else
      render :edit
    end
  end

  def create
    @post = Post.new(title: "Untitled", content: "Content", user: current_user)
    authorize @post
    @post.save
    redirect_to edit_post_path(@post)
  end

  private

  def post_params
    params.require(:post).permit(:title, :content)
  end
end
