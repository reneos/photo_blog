class DashboardController < ApplicationController
  def index
    @posts = policy_scope(Post.published)
    @drafts = policy_scope(Post.not_published)
  end
end
