class LinkSurvey < ApplicationRecord
    has_many :survey_ques_answer, dependent: :destroy
    scope :status, -> {where(status: 'Active')}
    validates :title, presence: true
    validates :status, presence: true
end
