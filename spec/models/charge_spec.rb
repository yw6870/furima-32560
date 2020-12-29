require 'rails_helper'

RSpec.describe Charge, type: :model do
  before do
    @charge = FactoryBot.build(:charge)
  end

  it "priceとtokenがあれば保存ができること" do
    expect(@order).to be_valid
  end

  it "priceが空では登録できないこと" do
    @order.price = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Price can't be blank")
  end

  it "tokenが空では登録できないこと" do
    @order.token = nil
    @order.valid?
    expect(@order.errors.full_messages).to include("Token can't be blank")
  end
end
