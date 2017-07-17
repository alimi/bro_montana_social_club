class AddUniquenessConstraintToYearOnCalendarYear < ActiveRecord::Migration[5.1]
  def change
    add_index :years, :calendar_year, unique: true
  end
end
