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

  has_many :questions, dependent: :destroy
  accepts_nested_attributes_for :questions, allow_destroy: true

  validates_presence_of :questions
  validates_presence_of :title


  def build_questionnaire_with_options(questions_count, answers_count)
    (1..questions_count.to_i).each_with_index do |q, questions_index|
      question = self.questions.build
      question.question_text = "#{questions_index+1} Вопрос"
      question.save
      (1..answers_count.to_i).each_with_index do |a, answers_index|
        answer = question.question_answers.build
        answer.answer_text = "#{answers_index+1} Ответ"
        answer.is_correct_flag = true if answers_index == 0
        answer.save
      end
    end
  end
end
