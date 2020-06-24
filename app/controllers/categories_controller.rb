class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!
  skip_after_action :verify_authorized

  def show
    @category = Category.find(params[:id])
    @posts = @category.posts.where(published: true)
    render 'posts/index'
  end
end
