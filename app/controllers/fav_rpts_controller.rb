class FavRptsController < ApplicationController
  def create
    fav_rpt = current_user.fav_rpts.create(report_id: params[:report_id])
    redirect_to reports_url, notice: "#{fav_rpt.report.user.name}さんの記事をお気に入り登録しました"
  end

  def destroy
    fav_rpt = current_user.fav_rpts.find_by(id: params[:id]).destroy
    redirect_to reports_url, notice: "#{fav_rpt.report.user.name}さんの記事をお気に入り解除しました"
  end

end
