class AddUniquenessConstraintToMembersOnEmail < ActiveRecord::Migration[5.1]
  def change
    add_index :members, :email, unique: true
  end
end
