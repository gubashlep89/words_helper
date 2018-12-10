# == Schema Information
#
# Table name: questionnaires
#
#  id          :bigint(8)        not null, primary key
#  title       :text
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  options     :jsonb
#

class Questionnaire < ApplicationRecord

  has_many :questions
  accepts_nested_attributes_for :questions, reject_if: :all_blank, allow_destroy: true


  def build_questionnaire_with_options(questions_count, answers_count)
    (1..questions_count.to_i).each do |q|
      question = self.questions.build
      question.save
      (1..answers_count.to_i).each do |a|
        answer = question.question_answers.build
        answer.save
      end
    end
  end
end
