class CreateHomeWorkTasksJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :home_works, :questionnaires do |t|
      t.references :home_work, foreign_key: true, index: true
      t.references :questionnaire, foreign_key: true, index: true
    end

    create_join_table :home_works, :word_lists do |t|
      t.references :home_work, foreign_key: true, index: true
      t.references :word_list, foreign_key: true, index: true
    end

    create_join_table :home_works, :students do |t|
      t.references :home_work, foreign_key: true, index: true
      t.references :student, foreign_key: true, index: true
    end
  end
end
