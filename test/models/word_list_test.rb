# == Schema Information
#
# Table name: word_lists
#
#  id           :bigint(8)        not null, primary key
#  name         :string
#  list_type    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  home_work_id :bigint(8)
#

require 'test_helper'

class WordListTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
