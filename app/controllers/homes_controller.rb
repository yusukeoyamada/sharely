class HomesController < ApplicationController
  def index
    @reports = Report.all.limit(5).order("created_at DESC")
    @questions = Question.all.limit(5).order("created_at DESC")
  end
end
