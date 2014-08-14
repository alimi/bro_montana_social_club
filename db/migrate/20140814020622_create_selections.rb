class CreateSelections < ActiveRecord::Migration
  def change
    create_table :selections do |t|
      t.integer :response_id
      t.integer :choice_id

      t.timestamps
    end
  end
end
