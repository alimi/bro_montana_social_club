class CreateQuestionaires < ActiveRecord::Migration[5.1]
  def change
    create_table :questionaires do |t|
      t.integer :year_id
      t.integer :member_id
      t.string :token
      t.datetime :available_meeting_times, array: true
      t.integer :contributing_fund_ids, array: true
      t.datetime :delivered_at
      t.datetime :completed_at

      t.timestamps
    end
  end
end
