class Fund < ApplicationRecord
  def contribution_amount_dollars
    if self.contribution_amount_cents.present?
      self.contribution_amount_cents / 100.0
    else
      0
    end
  end

  def contribution_amount_dollars=(new_contribution_amount)
    self.contribution_amount_cents = new_contribution_amount.to_f * 100
  end
end
