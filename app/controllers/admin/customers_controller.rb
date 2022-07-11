class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def manga_index

  end

  def update
    @customer = Customer.find(params[:id])
    @customer.update(customer_params)
    redirect_to  admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :encrypted_password, :introduction,)
  end
end
