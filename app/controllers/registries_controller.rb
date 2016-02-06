class RegistriesController < ApplicationController
  before_action :set_registry, only: [:show, :edit, :update, :destroy]

  def show
    if @registry.nil?
      redirect_to new_registry_path
    end
  end

  def new
    @registry = current_user.build_registry
  end

  def edit
  end

  def create
    @registry = current_user.build_registry(registry_params)

    if @registry.save
      redirect_to @registry, notice: 'Registry was successfully created.'
    else
      render :new
    end
  end

  def update
    if @registry.update(registry_params)
      redirect_to @registry, notice: 'Registry was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @registry.destroy
    redirect_to registries_url, notice: 'Registry was successfully destroyed.'
  end

  private

  def set_registry
    @registry = current_user.registry
  end

  def registry_params
    params.require(:registry).permit(:title)
  end
end
