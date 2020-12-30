require 'rails_helper'

RSpec.describe PurchaseHistory, type: :model do
  before do
    @purchase_history = FactoryBot.build(:purchase_history)
  end

  it "priceがあれば保存ができること" do
    expect(@purchase_history).to be_valid
  end

  it "priceが空では保存ができないこと" do
    @purchase_history.price = nil
    @purchase_history.valid?
    expect(@purchase_history.errors.full_messages).to include("Price can't be blank")
  end
end