# == Schema Information
#
# Table name: questionnaires
#
#  id           :bigint(8)        not null, primary key
#  title        :text
#  description  :text
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  options      :jsonb
#  home_work_id :bigint(8)
#

require 'test_helper'

class QuestionnaireTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
