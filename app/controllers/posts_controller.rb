class PostsController < ApplicationController
  # skip_before_action :verify_authenticity_token, only: :upload_image

  def index
    @posts = policy_scope(Post).published
    @drafts = policy_scope(Post).not_published
  end

  def show
    @post = Post.find(params[:id])
    authorize @post
  end

  def upload_image
    @post = Post.find(params[:id])
    authorize @post
    blob = ActiveStorage::Blob.create_after_upload!(
      io: params[:file],
      filename: params[:file].original_filename,
      content_type: params[:file].content_type
    )
    render json: { location: url_for(blob) }, content_type:  "text / html"
  end

  def edit
    @post = Post.find(params[:id])
    authorize @post
  end

  def update
    @post = Post.find(params[:id])
    authorize @post
    if @post.update(post_params)
      if params[:commit] == "Save"
        redirect_to edit_post_path(@post)
      else
        @post.update(published: true)
        redirect_to post_path(@post)
      end
    else
      render :edit
    end
  end

  def publish
    @post = Post.find(params[:id])
    @post.update(published: true)
    redirect_to post_path(@post)
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
