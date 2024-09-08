class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]


  def index
    @buy_shipping = BuyShipping.new
  end

  def create
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      @buy_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


end

private

def buy_params
  params.require(:buy_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building, :tel).merge(item_id: params[:item_id], user_id: current_user.id)
end

def set_item
  @item = Item.find(params[:item_id])
end


# ## buysテーブル
# | Column    | Type       | Options     |
# | --------- | ---------- | ----------- |
# | item      | references | null: false, foreign_key: true |
# | user      | references | null: false, foreign_key: true |

# ### Association

# - belongs_to :user
# - belongs_to :item
# - has_one :shipping

# ## shippingsテーブル
# | Column           | Type       | Options     |
# | ---------------- | ---------- | ----------- |
# | post_code        | string     | null: false |
# | shipping_area_id | integer    | null: false |
# | city             | string     | null: false |
# | address          | string     | null: false |
# | building         | string     |
# | tel              | string     | null: false |
# | buy              | references | null: false, foreign_key: true |

# ### Association

# - belongs_to :buy
