# == Schema Information
#
# Table name: question_answers
#
#  id          :bigint(8)        not null, primary key
#  answer_text :text
#  question_id :bigint(8)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'test_helper'

class QuestionAnswerTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
