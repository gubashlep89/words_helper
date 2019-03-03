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
#  home_work_id     :bigint(8)
#

class Student < ApplicationRecord
  belongs_to :user
  belongs_to :student_group, optional: true
  has_one :teacher, through: :student_group

  scope :free, -> { where(student_group_id: nil) }

  validate :check_if_teacher

  def name
    user.name
  end
  private

  def check_if_teacher
    if user.teacher
      self.errors.add(:base, "Вы зарегестрированы как 'Ученик', для смены роли необходимо зайти в личный кабинет")
    end
  end
end
