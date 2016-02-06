class GiftsController < ApplicationController
  before_action :set_gift, only: [:show, :update, :destroy]

  def show
  end

  def new
    @gift = Gift.new
  end

  def create
    @gift = Gift.new(gift_params)

    if @gift.save
      redirect_to @gift, notice: 'Gift was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @gift.destroy
    redirect_to gifts_url, notice: 'Gift was successfully destroyed.'
  end

  private

  def set_gift
    @gift = Gift.find(params[:id])
  end

  def gift_params
    params.require(:gift).permit(:url, :description, :image_url)
  end
end
