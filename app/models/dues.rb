class Dues
  include ActiveModel::Model

  attr_accessor :amount_cents

  def amount_dollars
    if self.amount_cents.present?
      self.amount_cents / 100.0
    else
      0
    end
  end

  def amount_dollars=(new_amount)
    self.amount_cents = new_amount.to_f * 100
  end
end
