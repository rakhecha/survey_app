class SurveyQuesAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :link_survey
  # belongs_to :user_answer

  scope :survey, -> (arg) {where("link_survey_id = ?", arg)}
  scope :ques_id, -> (arg) {where("question_id = ?", arg)}
  

end