class CreateHomeWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :home_works do |t|
      t.boolean :group_or_student, default: false
      t.datetime :check_point
      t.text :comment
      t.references :teacher, foreign_key: true
      t.references :student_group, foreign_key: true

      t.timestamps
    end
  end
end