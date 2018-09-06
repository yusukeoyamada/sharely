class AnswersController < ApplicationController

  def create
    @question = Question.find(params[:question_id])
    @answer = @question.answers.build(answer_params)

    respond_to do |format|
      if @answer.save
        format.js { render :index }
      else
        format.html { redirect_to question_path(@question), notice: '投稿できませんでした...' }
      end
    end
  end

  private
    def answer_params
      params.require(:answer).permit(:question_id, :content)
    end
end