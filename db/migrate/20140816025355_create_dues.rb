class CreateDues < ActiveRecord::Migration
  def change
    create_table :dues do |t|
      t.float :amount
      t.integer :year

      t.timestamps
    end
  end
end
