class UserAnswer < ApplicationRecord
  belongs_to :question
  belongs_to :answer
  belongs_to :link_survey
  belongs_to :user

  scope :survey, -> (arg) {where("link_survey_id = ?", arg)}
  scope :question, -> (arg) {where("question_id = ?", arg)}
  scope :user_id, -> (arg) {where("user_id = ?", arg).distinct}
  
end