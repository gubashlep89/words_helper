# == Schema Information
#
# Table name: words
#
#  id           :bigint(8)        not null, primary key
#  english_word :string
#  value        :string
#  word_list_id :bigint(8)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class WordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
