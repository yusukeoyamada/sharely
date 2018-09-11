class FavQuesController < ApplicationController
  def create
    fav_que = current_user.fav_ques.create(question_id: params[:question_id])
    redirect_to questions_url, notice: "#{fav_que.question.user.name}さんの質問をお気に入り登録しました"
  end

  def destroy
    fav_que = current_user.fav_ques.find_by(id: params[:id]).destroy
    redirect_to questions_url, notice: "#{fav_que.question.user.name}さんの質問をお気に入り解除しました"
  end
end
