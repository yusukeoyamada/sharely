class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:show, :new, :create, :edit, :update, :destroy]
  before_action :ensure_correct_user, only: [:edit, :update, :destroy]

  def confirm
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    render :new if @question.invalid?
  end

  def index
    @questions = Question.all.order("created_at DESC")
  end

  def show
    @answers = @question.answers
    @answer = @question.answers.build
    @fav_ques = current_user.fav_ques.find_by(question_id: @question.id)
  end

  def new
    if params[:back]
      @question = Question.new(question_params)
      @question.image.retrieve_from_cache! params[:cache][:image] if params[:cache][:image].present?
    else
      @question = Question.new
    end
  end

  def destroy
    @question.destroy
    redirect_to questions_path, notice:"質問を削除しました！"
  end

  def update
    if @question.update(question_params)
      redirect_to questions_path, notice: "質問を編集しました！"
    else
      render 'edit'
    end
  end

  def create
    @question = Question.new(question_params)
    @question.user_id = current_user.id
    @question.image.retrieve_from_cache!  params[:cache][:image] if params[:cache][:image].present?
    if @question.save
      redirect_to questions_path, notice: "質問しました！"
    else
      render 'new'
    end
  end

  private

  def question_params
    params.require(:question).permit(:title,
      :content, :image, :image_cache, :relation_word_list)
  end

  def set_question
    @question = Question.find(params[:id])
  end

  def ensure_correct_user
    @question = Question.find_by(id: params[:id])
    if current_user.id != @question.user_id
      flash[:notice] = "権限がありません"
      redirect_to("/")
    end
  end
end
