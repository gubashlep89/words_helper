class CreateHomeWorks < ActiveRecord::Migration[5.2]
  def change
    create_table :home_works do |t|
      t.integer :group_or_student
      t.datetime :check_point
      t.text :comment
      t.references :teacher, foreign_key: true

      t.timestamps
    end
  end
end