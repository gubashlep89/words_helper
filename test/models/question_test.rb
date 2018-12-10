# == Schema Information
#
# Table name: questions
#
#  id               :bigint(8)        not null, primary key
#  question_text    :text
#  correct_answer   :integer
#  questionnaire_id :bigint(8)
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

require 'test_helper'

class QuestionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
