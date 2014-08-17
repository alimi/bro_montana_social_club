class AddWepayCheckoutIdToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :wepay_checkout_id, :string
  end
end
