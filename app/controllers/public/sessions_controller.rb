# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]
  # before_action :configure_sign_in_params, only: [:create]

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    customers_my_page_path # ログイン後に遷移するpathを設定
  end

  def after_admin_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
  end

  protected
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer
  if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
    redirect_to root_path
  end
  end
end