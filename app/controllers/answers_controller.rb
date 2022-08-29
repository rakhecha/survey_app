class AnswersController < ApplicationController
  def index
    @answers  = Answer.all()
  end

  def show
    @answer = Answer.find(params[:id])
  end

  def create
    @answer = Answer.new(answer_params)
    if @answer.save
      flash[:notice] = 'Answer successfully added'
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @answer = Answer.find(params[:id])
  end

  def update
    @answer = Answer.find(params[:id])
    if @answer.update(answer_params)
      flash[:notice] = 'Answer successfully updated'
      redirect_to questions_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
  end

  def destroy
    @answer = Answer.find(params[:id])
    @answer.destroy
    flash[:notice] = 'Answer successfully deleted'
    redirect_to questions_path
  end

  private
    def answer_params      
      params.require(:answer).permit(:answer_text)
    end
end
