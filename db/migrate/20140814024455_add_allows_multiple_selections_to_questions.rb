class AddAllowsMultipleSelectionsToQuestions < ActiveRecord::Migration
  def change
    add_column :questions, :allows_multiple_selections, :boolean, default: false
  end
end
