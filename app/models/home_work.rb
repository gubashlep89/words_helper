# == Schema Information
#
# Table name: home_works
#
#  id               :bigint(8)        not null, primary key
#  group_or_student :boolean          default(FALSE)
#  check_point      :datetime
#  comment          :text
#  teacher_id       :bigint(8)
#  student_group_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class HomeWork < ApplicationRecord

  belongs_to :teacher
  belongs_to :student_group, foreign_key: 'student_group_id', required: false

  has_and_belongs_to_many :questionnaires
  has_and_belongs_to_many :word_lists
  has_and_belongs_to_many :students

  validate :check_list_or_questionnaire
  validate :check_student_or_group
  validates_presence_of :student_group

  def check_group_or_student
    if group_or_student and self.student_group
      self.students = self.student_group.students
    end
  end

  def students
    if group_or_student
      student_group.students
    else
      super
    end
  end

  private

  def check_list_or_questionnaire
    if self.questionnaires.empty? and self.word_lists.empty?
      self.errors.add(:base, "Должен быть выбраны, хотя бы один тест или список слов.")
    end
  end

  def check_student_or_group
    if self.students.empty? and !self.group_or_student
      self.errors.add(:base, "Необходимо выбрать одного или несколько студентов, либо укажите, что задание для всей группы.")
    end
  end

end
