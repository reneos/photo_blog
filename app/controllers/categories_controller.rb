class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
    @posts = @category.posts.where(published: true)
    render 'posts/index'
  end
end
