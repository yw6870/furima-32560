class PurchaseHistoriesController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @user_charge = UserCharge.new
  end

  def create
    @user_charge = UserCharge.new(user_charge_params)
    binding.pry
    if @user_charge.valid?
      pay_item
      @user_charge.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def user_charge_params
    params.require(:user_charge).permit(:card_number, :card_exp_month, :card_exp_year, :card_cvc, :postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  # def pay_item
  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
  #   Payjp::Charge.create(
  #     amount: charge_params[:price],  # 商品の値段
  #     card: charge_params[:token],    # カードトークン
  #     currency: 'jpy'                 # 通貨の種類（日本円）
  #   )
  # end

end
