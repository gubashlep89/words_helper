class CreateQuestionAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :question_answers do |t|
      t.text :answer_text
      t.references :question, foreign_key: true

      t.timestamps
    end
  end
end
