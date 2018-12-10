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

class Question < ApplicationRecord

  belongs_to :questionnaire

  has_many :question_answers
  accepts_nested_attributes_for :question_answers, reject_if: :all_blank, allow_destroy: true


end
