class SurveysController < ApplicationController
  def index
    @surveys = LinkSurvey.all
  end

  def show
  end

  def new
    @survey = LinkSurvey.new
    @questions  = Question.all
    @answers  = Answer.all
  end

  def create
    
    @survey = LinkSurvey.new(survey_params)
    if @survey.save!
      # logger.info(params[:survey_question_answer]['answer_id'])

      questions = params[:survey_question_answer]['question_ids']
      answers = params[:survey_question_answer]['answer_id']
      
      newAns = []

      params[:survey_question_answer]['answer_id'].each do |a, i|

        if a == "" && i != 0
          newAns.push(",");
        end

        if a != ""
          newAns.push(a);
        end
      end

      ansStr = newAns.join("");
      andArr = ansStr.split(",");
      andArr.delete_at(0) unless andArr.empty?
      obj = [];

      params[:survey_question_answer]['question_ids'].each_with_index do |qu, ind|
        if qu != ""
          final = andArr[ind].split("");
          obj.push({
            ques: qu,
            ans: final
        });
        end
      end

      # [{:ques=>"1", :ans=>["1", "2"]}, {:ques=>"3", :ans=>["2", "4", "5"]}]
      
      obj.each do |value, index|
        
        value[:ans].each do |inner_val, inner_index|

          
          # @linked_survey.save
          logger.info(inner_val)
          logger.info(value[:ques])
          logger.info(@survey.id)

          @linked_survey = SurveyQuesAnswer.new
          @linked_survey.answer_id = inner_val
          @linked_survey.question_id = value[:ques]
          @linked_survey.link_survey_id = @survey.id
          @linked_survey.save!          
        end

      end


      flash[:notice] = 'Survey successfully added'

      redirect_to surveys_path
    else
      render :new, status: :unprocessable_entity
    end


  end

  def edit
    @survey = LinkSurvey.find(params[:id])
    
  end

  def update
    @survey = LinkSurvey.find(params[:id])

    if @survey.update(survey_params)
      flash[:notice] = 'Survey successfully updated'
      redirect_to surveys_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  

  def destroy
  end

  private
      def survey_params      
        params.require(:survey).permit!
      end

end
