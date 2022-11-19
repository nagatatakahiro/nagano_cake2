class Public::OrdersController < ApplicationController
  POSTAGE = 800

  def new
    @order = Order.new
  end
  def confirm
    @order = Order.new(order_params)
    @address = Address.find(params[:order][:address_id])
    @order.postal_code = @address.postal_code
    @order.address = @address.address
    @order.name = @address.name
    @cart_items = current_customer.cart_items
    @total = 0
    @postage = POSTAGE
  end

  def show
  end

  private
  def order_params
   params.require(:order).permit(:payment_method, :postal_code, :address, :name)
  end
end
