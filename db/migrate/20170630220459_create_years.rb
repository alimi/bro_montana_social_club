class CreateYears < ActiveRecord::Migration[5.1]
  def change
    create_table :years do |t|
      t.integer :calendar_year
      t.string :next_task

      t.timestamps
    end
  end
end
