# == Schema Information
#
# Table name: students
#
#  id               :bigint(8)        not null, primary key
#  user_id          :bigint(8)
#  description      :text
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  student_group_id :bigint(8)
#

class Student < ApplicationRecord
  belongs_to :user
  belongs_to :student_group
  has_one :teacher, through: :student_group

  validate :check_if_teacher


  private

  def check_if_teacher
    if user.teacher
      self.errors.add(:base, "Вы зарегестрированы как 'Ученик', для смены роли необходимо зайти в личный кабинет")
    end
  end
end
