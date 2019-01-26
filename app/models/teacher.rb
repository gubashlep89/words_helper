# == Schema Information
#
# Table name: teachers
#
#  id          :bigint(8)        not null, primary key
#  user_id     :bigint(8)
#  rating      :decimal(8, 5)
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Teacher < ApplicationRecord

  belongs_to :user

  has_many :student_groups, dependent: :destroy
  has_many :students, through: :student_groups

  after_create :create_base_group

  validate :check_if_student

  def build_link_to_student

  end

  def create_base_group
    base_group = self.student_groups.build(name: 'Ученики без группы', group_type: :base)
    base_group.save
  end

  private

  def check_if_student
    if user.student
      self.errors.add(:base, "Вы зарегестрированы как 'Преподаватель', для смены роли необходимо зайти в личный кабинет")
    end
  end
end
