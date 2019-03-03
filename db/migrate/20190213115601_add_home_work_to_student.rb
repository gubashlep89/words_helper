class AddHomeWorkToStudent < ActiveRecord::Migration[5.2]
  def up
    add_reference :students, :home_work, foreign_key: true
    add_reference :questionnaires, :home_work, foreign_key: true
    add_reference :word_lists, :home_work, foreign_key: true
  end
  def down
    remove_reference :students, :home_work, foreign_key: true
    remove_reference :questionnaires, :home_work, foreign_key: true
    remove_reference :word_lists, :home_work, foreign_key: true
  end
end
