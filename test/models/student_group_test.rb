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

require 'test_helper'

class StudentGroupTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
