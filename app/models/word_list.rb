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

  STATUSES = [:verb, :adjective, :noun]
  enum list_type: STATUSES

  has_many :words
  accepts_nested_attributes_for :words, reject_if: :all_blank, allow_destroy: true


  # def random_word
  #   words.sample
  # end

end
