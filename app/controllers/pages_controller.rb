class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home, :stats]

  def home
  end

  def stats
  end
end
