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

#
# слово(хранит слово на англиском и на русском)
#

class Word < ApplicationRecord
  belongs_to :word_list
end
