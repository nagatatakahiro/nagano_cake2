class Public::CustomersController < ApplicationController
  def show
    @User = current_customer
  end

  def edit
    @User = current_customer
  end
end
