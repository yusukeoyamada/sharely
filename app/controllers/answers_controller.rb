class AnswersController < ApplicationController
  before_action :ensure_correct_user

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)
    @answer.user_id = current_user.id

    respond_to do |format|
      if @answer.save
        format.js { render :index }
      else
        format.html { redirect_to question_path(@question), notice: '回答欄の空白等が原因で回答できませんでした' }
      end
    end
  end

  private
  
  def answer_params
    params.require(:answer).permit(:question_id, :content)
  end

  def ensure_correct_user
    @question = Question.find(params[:question_id])
    if current_user.id == @question.user.id
      redirect_to question_path(@question.id), notice: '権限がありません'
    end
  end
end
