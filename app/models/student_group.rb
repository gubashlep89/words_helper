# == Schema Information
#
# Table name: student_groups
#
#  id          :bigint(8)        not null, primary key
#  teacher_id  :bigint(8)
#  name        :string
#  group_type  :integer
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class StudentGroup < ApplicationRecord

  belongs_to :teacher

  has_many :students, dependent: :nullify

  enum group_types: [:base, :custom]

  validates_presence_of :name
  validates_uniqueness_of :name, scope: :teacher_id

end
