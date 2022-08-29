module UserAnswersHelper
    def get_ques_by_id(ques_id)
        Question.find(ques_id).question_text
    end
    def get_ans_by_id(ans_id)
        Answer.find(ans_id).answer_text
    end

    def check_test_attempted(survey_id)
        user_id = current_user.id
        res = UserAnswer.survey(survey_id).user_id(user_id).count
    end

    def get_email_by_id(user_id)
        User.find(user_id).email
    end

    def get_survey_title_by_id(survey_id)
        LinkSurvey.find(survey_id).title
    end

end
