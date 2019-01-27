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

  before_save :set_question_correct_answer
  validate :correct_answer_presence
  validates_presence_of :question_text, :question_answers

  belongs_to :questionnaire

  has_many :question_answers, dependent: :destroy
  belongs_to :correct_answer, foreign_key: :correct_answer, class_name: 'QuestionAnswer', optional: true
  accepts_nested_attributes_for :question_answers, reject_if: :all_blank, allow_destroy: true

  def correct_answer_from_collection
    self.question_answers.find{|answer| answer.is_correct_flag}
  end

  private

  def set_question_correct_answer
    self.correct_answer = self.correct_answer_from_collection
  end

  def correct_answer_presence
    if self.correct_answer_from_collection.nil?
      self.errors.add(:correct_answer, :blank)
    end
  end

end
