class Admin::ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      #flash[:success] = "メールアドレスを更新しました"
      redirect_to admin_items_path
    else
      render :new
    end
  end
  def item_params
    params.require(:item).permit(:name, :introduction, :price, :is_active, :image)
  end
end
