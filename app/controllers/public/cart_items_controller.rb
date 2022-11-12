class Public::CartItemsController < ApplicationController
  def index
    @cart_items = current_customer.cart_items
    @total = 0
  end
  def create
    @cart_item = CartItem.new(cart_item_params)
    @cart_item.customer_id = current_customer.id
    @cart_item.save
    redirect_to cart_items_path

  end
  def destroy
    cart_item = CartItem.find(params[:id])  # データ（レコード）を1件取得
    cart_item.destroy  # データ（レコード）を削除
    redirect_to '/cart_items'  # 投稿一覧画面へリダイレクト
  end
  def destroy_all
    CartItem.destroy_all
    redirect_to root_path
  end
  private
  def cart_item_params
      params.require(:cart_item).permit(:item_id, :amount)
  end
end
