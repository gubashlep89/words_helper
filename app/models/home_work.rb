# == Schema Information
#
# Table name: home_works
#
#  id               :bigint(8)        not null, primary key
#  group_or_student :integer
#  check_point      :datetime
#  comment          :text
#  teacher_id       :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class HomeWork < ApplicationRecord

  belongs_to :teacher
  has_many :students

  enum group_or_students: [:for_group, :for_student]

  def student_group
    if self.students.empty?
      student_group = nil
    else
      student_group = self.students.student_group
    end
    student_group
  end

end
