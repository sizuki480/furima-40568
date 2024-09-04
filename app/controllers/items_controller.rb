class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.all.order('created_at desc')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @item = Item.find(params[:id])
    @user = @item.user
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :explanation, :category_id, :situation_id, :shipping_pay_id, :shipping_area_id,
                                 :shipping_time_id, :price, :image).merge(user_id: current_user.id)
  end
end

# | name             | string     | null: false |
# | explanation      | text       | null: false |
# | category_id      | integer    | null: false |
# | situation_id     | integer    | null: false |
# | shipping_pay_id  | integer    | null: false |
# | shipping_area_id | integer    | null: false |
# | shipping_time_id | integer    | null: false |
# | price            | integer    | null: false |
# | user             | references | null: false, foreign_key: true |
