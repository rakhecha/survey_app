class CreateSurveyQuestionAnswers < ActiveRecord::Migration[7.0]
  def change
    create_table :survey_question_answers do |t|
      t.references :linksurvey, null: false, foreign_key: true
      t.references :question, null: false, foreign_key: true
      t.references :answer, null: false, foreign_key: true
      t.timestamps
    end
  end
end
