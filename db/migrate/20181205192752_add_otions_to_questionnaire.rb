class AddOtionsToQuestionnaire < ActiveRecord::Migration[5.2]
  def change
    add_column :questionnaires, :options, :jsonb, default: {}
  end
end
