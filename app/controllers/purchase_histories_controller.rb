class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation

  def index
    @user_charge = UserCharge.new
  end

  def create
    @user_charge = UserCharge.new(user_charge_params)
    if @user_charge.valid?
      pay_item
      @user_charge.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def user_charge_params
    params.require(:user_charge).permit(:postal_code, :prefecture_id, :city, :addresses, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: user_charge_params[:token],
      currency: 'jpy'
    )
  end

  def contributor_confirmation
    redirect_to root_path if current_user == @item.user || PurchaseHistory.where(item_id: @item.id).exists?
  end
end
