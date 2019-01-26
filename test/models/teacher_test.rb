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

require 'test_helper'

class TeacherTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
