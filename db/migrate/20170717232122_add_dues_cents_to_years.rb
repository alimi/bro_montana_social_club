class AddDuesCentsToYears < ActiveRecord::Migration[5.1]
  def change
    add_column :years, :dues_cents, :integer, default: 0
  end
end
