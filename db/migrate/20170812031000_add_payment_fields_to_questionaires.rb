class AddPaymentFieldsToQuestionaires < ActiveRecord::Migration[5.1]
  def change
    add_column :questionaires, :paid_at, :datetime
    add_column :questionaires, :payment_token, :string
  end
end
