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

require 'test_helper'

class HomeWorkTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
