class Public::RequestsController < ApplicationController
before_action :authenticate_customer!
  def new
    @request = Request.new
  end

  def completion
  end

  def create
    @request = Request.new(request_params)
    @request.customer = current_customer
    @request.save
    redirect_to requests_completion_path
  end

  private

  def request_params
    params.require(:request).permit(:title, :author)
  end
end
