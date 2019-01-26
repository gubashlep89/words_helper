class AddStudentGroupToStudent < ActiveRecord::Migration[5.2]
  def change
    add_reference :students, :student_group, foreign_key: true
  end
end
