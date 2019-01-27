class AddIsCorrectFlagToQuestionAnswer < ActiveRecord::Migration[5.2]
  def change
    add_column :question_answers, :is_correct_flag, :boolean, default: false
  end
end
