class SurveyQuestionAnswer < ApplicationRecord
  belongs_to :LinkSurvey
  belongs_to :question
  belongs_to :answer
end