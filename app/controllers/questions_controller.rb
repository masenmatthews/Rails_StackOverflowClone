class QuestionsController < ApplicationController
  def index
    @questions = Question.all
  end

  def new
    @question = Question.new
  end

  def create
    @user = User.find(session[:user_id])
    @question = @user.questions.new(question_params)
    if @question.save
      flash[:notice] = "Thanks, your question is has been added to the list!"
      redirect_to questions_path
    else
      render :new
    end
  end

  private
  def question_params
    params.require(:question).permit(:question_title, :question_body)
  end
end