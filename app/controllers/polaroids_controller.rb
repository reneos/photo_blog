class PolaroidsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @polaroids = policy_scope(Polaroid).all
  end

  def show
    @polaroid = Polaroid.find(params[:id])
  end

  def create
  end

  private

  def polaroid_params
    params.require(:polaroid).permit(:photo)
  end
end
