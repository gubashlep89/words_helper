class CreateStudentGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :student_groups do |t|
      t.references :teacher, foreign_key: true
      t.string :name
      t.integer :group_type
      t.text :description

      t.timestamps
    end
  end
end
