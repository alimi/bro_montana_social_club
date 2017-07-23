class CreateFunds < ActiveRecord::Migration[5.1]
  def change
    create_table :funds do |t|
      t.string :name
      t.integer :contribution_amount_cents
      t.belongs_to :year

      t.timestamps
    end
  end
end
