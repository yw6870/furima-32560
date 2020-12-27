require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/test_image.png')
  end

  describe '商品出品機能' do
    context '商品が出品できる場合' do
      it '画像とテキストがあれば投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '商品が出品できない場合' do
      it 'imageが空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空では出品できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'infoが空では出品できない' do
        @item.info = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end
      it 'categoryが選択されていなければ出品できない' do
        @item.category_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Category select')
      end
      it 'categoryが1（--）の場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category select')
      end
      it 'sales_statusが選択されていなければ出品できない' do
        @item.sales_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status select')
      end
      it 'sales_statusが1（--）の場合は出品できない' do
        @item.sales_status_id = １
        @item.valid?
        expect(@item.errors.full_messages).to include('Sales status select')
      end
      it 'shipping_fee_statusが選択されていなければ出品できない' do
        @item.shipping_fee_status_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status select')
      end
      it 'shipping_fee_statusが1（--）の場合は出品できない' do
        @item.shipping_fee_status_id = １
        @item.valid?
        expect(@item.errors.full_messages).to include('Shipping fee status select')
      end
      it 'prefectureが選択されていなければ出品できない' do
        @item.prefecture_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture select')
      end
      it 'prefectureが1（--）の場合は出品できない' do
        @item.prefecture_id = １
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture select')
      end
      it 'scheduled_deliveryが選択されていなければ出品できない' do
        @item.scheduled_delivery_id = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery select')
      end
      it 'scheduled_deliveryが1（--）の場合は出品できない' do
        @item.scheduled_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Scheduled delivery select')
      end
      it 'priceが空では出品できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceの値が300より小さければ出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceの値が9,999,999より大きければ出品できない' do
        @item.price = 10,000,000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price out of setting range')
      end
      it 'priceが半角意外（全角）では出品できない' do
        @item.price = '５５５'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price half-width number')
      end
      it 'ユーザーidが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('User must exist')
      end
    end
  end
end
