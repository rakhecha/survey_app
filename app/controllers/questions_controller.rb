class QuestionsController < ApplicationController
  def index
    @questions  = Question.all()
    @answers    = Answer.all()
  end

  def show
    @question = Question.find(params[:id])
  end

  def create
    @question = Question.new(question_params)
    if @question.save
      flash[:notice] = 'Question successfully added'
      redirect_to questions_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    
      if @question.update(question_params)
        flash[:notice] = 'Question successfully updated'
        redirect_to questions_path
      else
        render :edit, status: :unprocessable_entity
      end
  end

  def new
  end

  def destroy
    @question = Question.find(params[:id])
        @question.destroy
        flash[:notice] = 'Question successfully deleted'
        redirect_to questions_path
  end

  private
      def question_params      
        params.require(:question).permit(:question_text)
      end

end
