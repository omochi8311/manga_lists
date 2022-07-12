class Admin::RequestsController < ApplicationController

  def top
    @requests = Request.all
  end

  def destroy
    @request = Request.find(params[:id])  # データ（レコード）を1件取得
    @request.destroy  # データ（レコード）を削除
    redirect_to admin_path  # 投稿一覧画面へリダイレクト
  end

  private

  def request_params
    params.require(:request).permit(:title, :author)
  end
end
