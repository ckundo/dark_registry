class GiftsController < ApplicationController
  before_action :require_login
  before_action :set_gift, only: [:show, :update, :destroy]

  def show
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      redirect_to registry_path(@gift.registry), notice: 'Gift was successfully created.'
    else
      redirect_to registry_path(@gift.registry), error: 'Could not save gift'
    end
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:url, :description, :image_url)
  end
end
