require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item) # itemのインスタンス生成
  end

  describe '商品出品' do
    context '商品情報がデータベースに保存できる場合' do
      it '必要な情報が全て存在すれば保存できる' do
        expect(@item).to be_valid
      end
    end

    context '商品情報がデータベースに保存できない場合' do
      it '商品画像がないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がないと保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がないと保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリー情報がないと保存できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態情報がないと保存できない' do
        @item.situation_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Situation can't be blank")
      end

      it '配送料の負担情報がないと保存できない' do
        @item.shipping_pay_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping pay can't be blank")
      end

      it '発送元の地域情報がないと保存できない' do
        @item.shipping_area_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area can't be blank")
      end

      it '発送までの日数情報がないと保存できない' do
        @item.shipping_time_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping time can't be blank")
      end

      it '価格情報がないと保存できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be a number between ¥300 and ¥9,999,999')
      end

      it '価格が10,000,000円以上では保存できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be a number between ¥300 and ¥9,999,999')
      end

      it '価格が半角数字でないと保存できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be a number between ¥300 and ¥9,999,999')
      end
    end
  end
end
