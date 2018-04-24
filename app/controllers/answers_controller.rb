class AnswersController < ApplicationController

  def new
    @question = Question.find(params[:question_id])
    @answer = Answer.new
  end

  def create
  @question = Question.find(params[:question_id])
  @answer = @question.answers.new(answer_params)
  if @answer.save
    flash[:notice] = "Thanks, your answer is has been added to the list!"
    redirect_to question_path(@question.id)
  else
    render :new
  end
end

  def edit
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
  end

  def update
    @question = Question.find(params[:question_id])
    @answer = Answer.find(params[:id])
    if @answer.update!(answer_params)
      flash[:notice] = "Your question was updated!"
      redirect_to question_path(@question.id)
    else
      render :edit
    end
  end

  def destroy
    @answer = Answer.find(params[:id])
    @question_id = @answer.question_id
    @answer.destroy
    redirect_to question_path(@question_id)
  end


  private
  def answer_params
    params.require(:answer).permit(:answer_body)
  end

end
