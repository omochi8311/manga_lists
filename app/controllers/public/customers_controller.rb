class Public::CustomersController < ApplicationController

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def index
    @customers = Customer.all.page(params[:page]).per(10)
  end

  def page
    @customer = current_customer
  end

  def postlist
    @customer = Customer.find(params[:id])
  end

  def withdrawal
  end

  def quit
    @customer = current_customer
    @customer.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to customers_my_page_path
  end

  def customer_params
    params.require(:customer).permit(:nickname, :email, :introduction, :is_deleted, :image)
  end
end
