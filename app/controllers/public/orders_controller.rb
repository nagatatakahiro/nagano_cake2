class Public::OrdersController < ApplicationController
  POSTAGE = 800

  def new
    @order = Order.new
  end
  def confirm
    @order = Order.new(order_params)
    if params[:order][:address_select] == "0"
     @order.postal_code = current_customer.postal_code
     @order.address = current_customer.address
     @order.name = current_customer.full_name
    elsif params[:order][:address_select] == "1"
     @address = Address.find(params[:order][:address_id])
     @order.postal_code = @address.postal_code
     @order.address = @address.address
     @order.name = @address.name
    else
     @order.postal_code = params[:postal_code]
     @order.address = params[:address]
     @order.name = params[:name]
    end
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
