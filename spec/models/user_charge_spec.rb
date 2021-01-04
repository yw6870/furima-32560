require 'rails_helper'

RSpec.describe UserCharge, type: :model do
  before do
    @user_charge = FactoryBot.build(:user_charge)
  end

  it 'token,postal_code,prefecture_id,city,addresses,phone_numberがあれば保存ができること' do
    expect(@user_charge).to be_valid
  end

  it 'postal_codeが空では保存ができないこと' do
    @user_charge.postal_code = nil
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include("Postal code can't be blank")
  end
  it 'postal_codeに-（ハイフン）がなければ保存ができないこと' do
    @user_charge.postal_code = 1234567
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include("Postal code input correctly")
  end
  it 'tokenが空では保存ができないこと' do
    @user_charge.token = nil
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include("Token can't be blank")
  end
  it 'scheduled_deliveryが選択されていなければ出品できない' do
    @user_charge.prefecture_id = nil
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include('Prefecture select')
  end
  it 'scheduled_deliveryが1（--）の場合は出品できない' do
    @user_charge.prefecture_id = 1
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include('Prefecture select')
  end
  it 'cityが空では保存ができないこと' do
    @user_charge.city = nil
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include("City can't be blank")
  end
  it 'addressesが空では保存ができないこと' do
    @user_charge.addresses = nil
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include("Addresses can't be blank")
  end
  it 'phone_numberが空では保存ができないこと' do
    @user_charge.phone_number = nil
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include("Phone number can't be blank")
  end
  it 'phone_numberが半角数字意外（全角）では保存ができないこと' do
    @user_charge.phone_number = '０９０１２３４５６７８'
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include('Phone number input only number')
  end
  it 'phone_numberに-（ハイフン）が入っていれば保存ができないこと' do
    @user_charge.phone_number = '090-1234-5678'
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include('Phone number input only number')
  end
  it 'phone_numberに数字が12桁以上あれば保存ができないこと' do
    @user_charge.phone_number = 123456789123
    @user_charge.valid?
    expect(@user_charge.errors.full_messages).to include('Phone number input only number')
  end
end
