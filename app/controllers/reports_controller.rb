class ReportsController < ApplicationController
  before_action :set_report, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:confirm, :show, :new, :create, :edit, :update, :destroy]

  def confirm
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    render :new if @report.invalid?
  end

  def index
    @reports = Report.all
  end

  def show
    @fav_rpts = current_user.fav_rpts.find_by(report_id: @report.id)
  end

  def new
    if params[:back]
      @report = Report.new(report_params)
      @report.image.retrieve_from_cache! params[:cache][:image] if params[:cache][:image].present?
    else
      @report = Report.new
    end
  end

  def destroy
    @report.destroy
    redirect_to reports_path, notice:"質問を削除しました！"
  end

  def update
    if @report.update(report_params)
      redirect_to reports_path, notice: "質問を編集しました！"
    else
      render 'edit'
    end
  end

  def create
    @report = Report.new(report_params)
    @report.user_id = current_user.id
    @report.image.retrieve_from_cache!  params[:cache][:image] if params[:cache][:image].present?
  else
    if @report.save
      redirect_to reports_path, notice: "質問しました！"
    else
      render 'new'
    end
  end

  private
    def report_params
      params.require(:report).permit(:title,
        :content, :image, :image_cache)
    end

    def set_report
      @report = Report.find(params[:id])
    end

end
