class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.all
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end
  def update
    customer = Customer.find(params[:id])
    Customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :is_deleted, :telephone_number, :email, :password,:is_deleted)
  end
end
