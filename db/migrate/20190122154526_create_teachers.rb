class CreateTeachers < ActiveRecord::Migration[5.2]
  def change
    create_table :teachers do |t|
      t.references :user, foreign_key: true
      t.decimal :rating, precision: 8, scale: 5
      t.text :description

      t.timestamps
    end
  end
end
