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

require 'test_helper'

class StudentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
