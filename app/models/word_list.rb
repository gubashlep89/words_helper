# == Schema Information
#
# Table name: word_lists
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  list_type  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class WordList < ApplicationRecord

  STATUSES = [:low, :middle, :hard]

  enum list_type: STATUSES

  has_many :words, dependent: :destroy
  accepts_nested_attributes_for :words, reject_if: :all_blank, allow_destroy: true

  validate :words_exists

  private

  def words_exists
    errors.add(:base, 'Необходимо добавить хотя бы одно слово в ваш список') unless self.words.any?
  end

end
