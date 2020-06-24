class PagesController < ApplicationController
  skip_before_action :authenticate_user!

  def home
    @posts = policy_scope(Post).published.order(post_date: :desc).first(6)
  end

  def stats
  end
end
