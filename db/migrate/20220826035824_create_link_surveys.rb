class CreateLinkSurveys < ActiveRecord::Migration[7.0]
  def change
    create_table :link_surveys do |t|
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
