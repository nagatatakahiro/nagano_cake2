class Public::CustomersController < ApplicationController
  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end
  def update
    customer = Customer.find(params[:id])
    Customer.update(customer_params)
    redirect_to admin_customer_path(customer)
  end
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :is_deleted, :telephone_number, :email, :password)
  end
end
