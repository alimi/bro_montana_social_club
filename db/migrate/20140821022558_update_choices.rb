class UpdateChoices < ActiveRecord::Migration
  def change
    add_column :choices, :value, :string
    add_column :choices, :value_type, :integer, default: 0
  end
end
