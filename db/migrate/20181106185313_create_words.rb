class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :english_word
      t.string :value
      t.references :word_list, foreign_key: true

      t.timestamps
    end
  end
end
