class BuysController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, except: [:index, :create]


  def index
    ##出品者ならトップへ遷移
    if current_user == @item.user
      redirect_to root_path
    elsif 
      #購入済みならトップへ遷移
      @item.buy.present? 
      redirect_to root_path
    else
      @buy_shipping = BuyShipping.new
    end
  end

  def create
    # binding.pry
    @buy_shipping = BuyShipping.new(buy_params)
    if @buy_shipping.valid?
      pay_item
      @buy_shipping.save
      redirect_to root_path
    else
      render :index, status: :unprocessable_entity
    end
  end


end

private

def buy_params
  params.require(:buy_shipping).permit(:post_code, :shipping_area_id, :city, :address, :building, :tel).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
end

def set_item
  @item = Item.find(params[:item_id])
end

def pay_item
  Payjp.api_key = "sk_test_76224b28a49e961863b46678"  # 自身のPAY.JPテスト秘密鍵を記述しましょう
  Payjp::Charge.create(
    amount: @item.price,  # 商品の値段
    card: buy_params[:token],    # カードトークン
    currency: 'jpy'                 # 通貨の種類（日本円）
  )
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
