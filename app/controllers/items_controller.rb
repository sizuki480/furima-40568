class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
  end

  def new
  end

  private

  def item_params
    params.require(:item).permit(:shipping_area_id)
  end
end
