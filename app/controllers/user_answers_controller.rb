class UserAnswersController < ApplicationController
  def index
    @surveys  = LinkSurvey.status
  end

  def questions
    @survey_id = params[:id]
    @data = SurveyQuesAnswer.joins(:question, :answer, :link_survey).select('survey_ques_answers.*', 'questions.*', 'answers.*').where(link_survey: { id: params[:id] })
    
    quesArr = []
    ansArr = []
    
    @data.each do |ques|
      quesArr.push(ques.question_id)
    end
    quesArr = quesArr.uniq()

    @obj = []
    quesArr.each do |ques|
      @obj.push({
        ques: ques,
        ans: SurveyQuesAnswer.ques_id(ques).survey(params[:id])
     });
    end 

  end

  def create

    survey_id = params[:user_answer]['link_surveys_id']
    user_id = current_user.id
    answers = params[:user_answer]['answer']

    answers.each do |ques|
      res = ques.split('_')

      @userAnswer = UserAnswer.new
      @userAnswer.question_id    = res[0]
      @userAnswer.answer_id      = res[1]
      @userAnswer.user_id        = user_id
      @userAnswer.link_survey_id = survey_id
      @userAnswer.save!
    end
    flash[:notice] = 'Surevy response successfully submitted'
    redirect_to '/user_answers'
  end

  def userResponse
    @data = UserAnswer.select("DISTINCT ON (user_answers.link_survey_id) user_answers.*")
  end

  def userResponseDetail
    @survey_id = params[:survey_id]
    @user_id = params[:user_id]
    @data = UserAnswer.user_id(params[:user_id]).survey(params[:survey_id])

    quesArr = []
    ansArr = []

    @data.each do |ques|
      quesArr.push(ques.question_id)
    end
    quesArr = quesArr.uniq()

    @obj = []
    quesArr.each do |ques|
      @obj.push({
        ques: ques,
        ans: UserAnswer.select('answer_id').user_id(params[:user_id]).survey(params[:survey_id]).question(ques).to_a
     });
    end 
  end

end

