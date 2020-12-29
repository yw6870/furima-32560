class ChargesController < ApplicationController
  def create
    @charge = Order.new(charge_params)
    if @charge.valid?
      pay_item
      @charge.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def charge_params
    params.require(:order).permit(:price).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: charge_params[:price],  # 商品の値段
      card: charge_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
