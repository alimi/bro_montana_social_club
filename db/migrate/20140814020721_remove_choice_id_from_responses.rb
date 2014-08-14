class RemoveChoiceIdFromResponses < ActiveRecord::Migration
  def up
    remove_column :responses, :choice_id
  end

  def down
    add_column :responses, :choice_id, :integer
  end
end
