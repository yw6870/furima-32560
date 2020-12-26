require 'rails_helper'
RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context "商品が出品できる場合" do
      it "画像とテキストがあれば投稿できる" do
      end
    end
    context "ツイートが投稿できない場合" do
      it "テキストが空では投稿できない" do
      end     
      it "ユーザーが紐付いていなければ投稿できない" do
      end
    end
  end
end