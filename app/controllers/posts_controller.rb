class PostsController < ApplicationController
  before_action :set_post, only: [:show, :upload_image, :edit, :update, :destroy]

  def index
    @posts = policy_scope(Post).published
    @drafts = policy_scope(Post).not_published
  end

  def show
    authorize @post
  end

  def upload_image
    authorize @post
    blob = ImageHandler.call(@post, params)
    render json: { location: blob.service_url }, content_type: "text / html"
  end

  def edit
    @categories = Category.all
    authorize @post
  end

  def update
    params[:post][:category_id] = create_or_get_category(params[:post][:category_id])
    authorize @post
    if @post.update(post_params)
      if params[:commit] == "Save"
        redirect_to edit_post_path(@post)
      else
        publish(@post)
      end
    else
      render :edit
    end
  end

  def publish(post)
    if params[:post][:category_id].nil? || params[:post][:category_id] == ""
      @categories = Category.all
      flash[:alert] = "Can't publish with empty category"
      render :edit
    else
      post.update(published: true)
      PolaroidCreator.call(post)
      redirect_to post_path(post)
    end
  end

  def create
    @post = Post.new(title: "Untitled", content: "Content", user: current_user)
    authorize @post
    @post.save
    redirect_to edit_post_path(@post)
  end

  def destroy
    authorize @post
    @post.destroy
    flash[:notice] = "Deleted post #{@post.id}, title: #{@post.title}"
    redirect_to dashboard_index_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :content, :category_id)
  end

  def create_or_get_category(category_name)
    category_name.strip!
    return nil if category_name.empty?

    return Category.exists?(category_name) ? category_name : Category.create(name: category_name).id
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
