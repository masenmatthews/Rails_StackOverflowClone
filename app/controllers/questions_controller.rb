class QuestionsController < ApplicationController
  before_action :authorize, only: [:new]

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

  def show
    @question = Question.find(params[:id])
    @answers = @question.answers
  end

  def edit
    @question = Question.find(params[:id])
  end

  def destroy
    @question = Question.find(params[:id])
    @question.destroy
    redirect_to questions_path
  end

  def update
    @question = Question.find(params[:id])
    if @question.update!(question_params)
      flash[:notice] = "Good job! Your question was updated!"
      redirect_to question_path(@question)
    else
      render :edit
    end
  end

  private
  def question_params
    params.require(:question).permit(:question_title, :question_body)
  end
end
