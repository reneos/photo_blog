class CategoriesController < ApplicationController
  def show
    @category = Category.find(params[:id])
    authorize @category
    @posts = @category.posts
  end
end
