require 'rails_helper'

RSpec.describe BuyShipping, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.create(:item)
    @buy_shipping = FactoryBot.build(:buy_shipping, user_id: @user.id, item_id: @item.id)
    sleep(1)
  end

  describe '商品購入情報の保存' do
    
    context '商品購入情報が保存できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buy_shipping).to be_valid
      end
      it 'buildingは空でも保存できること' do
        @buy_shipping.building = ''
        expect(@buy_shipping).to be_valid
      end
    end

    context '商品購入情報が保存できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @buy_shipping.post_code = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Post code can't be blank")
      end

      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buy_shipping.post_code = '1234567'
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '発送先の地域情報がid=1では登録できない' do
        @buy_shipping.shipping_area_id = 1
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Shipping area can't be blank")
      end

      

      it 'cityが空では登録できない' do
        @buy_shipping.city = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空では登録できない' do
        @buy_shipping.address = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空では登録できない' do
        @buy_shipping.tel = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telが9桁以下である場合は購入できない' do
        @buy_shipping.tel = '12345678'
        @buy_shipping.valid?
        expect(@buy_shipping.errors[:tel]).to include("is invalid. Must be 10 or 11 digits")
      end

      it 'telが12桁以上である場合は購入できない' do
        @buy_shipping.tel = '1234567891012'
        @buy_shipping.valid?
        expect(@buy_shipping.errors[:tel]).to include("is invalid. Must be 10 or 11 digits")
      end

      it 'telが半角数値でない場合は購入できない' do
        @buy_shipping.tel = '１２３４５６７８９０１'
        @buy_shipping.valid?
        expect(@buy_shipping.errors[:tel]).to include("is invalid. Must be 10 or 11 digits")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @buy_shipping.item_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Item can't be blank")
      end

      it 'userが紐付いていないと保存できないこと' do
        @buy_shipping.user_id = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("User can't be blank")
      end

      it "tokenが空では登録できないこと" do
        @buy_shipping.token = nil
        @buy_shipping.valid?
        expect(@buy_shipping.errors.full_messages).to include("Token can't be blank")
      end

    end
  end
end







# 郵便番号が必須であること。

# 郵便番号は、「3桁ハイフン4桁」の半角文字列のみ保存可能なこと（良い例：123-4567　良くない例：1234567）。

# 都道府県が必須であること。

# 市区町村が必須であること。

# 番地が必須であること。

# 建物名は任意であること。

# 電話番号が必須であること。

# 電話番号は、10桁以上11桁以内の半角数値のみ保存可能なこと（良い例：09012345678　良くない例：090-1234-5678）。