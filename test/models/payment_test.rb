require 'test_helper'

class PaymentTest < ActiveSupport::TestCase
  test "#amount_cents" do
    fund_one = Fund.create!(id: 23, contribution_amount_cents: 500)
    fund_two = Fund.create!(id: 24, contribution_amount_cents: 500)
    year = Year.new(dues_cents: 2500)

    questionaire = Questionaire.new(
      year: year,
      contributing_fund_ids: [fund_one.id, fund_two.id]
    )

    payment = Payment.new(questionaire: questionaire)

    expected = 2500 + 500 + 500 + 135

    assert_equal expected, payment.amount_cents,
      "It returns the sum of the questionaire's selected funds and the year's dues plus payment processor fees"
  end

  test "#amount_dollars" do
    fund_one = Fund.create!(id: 23, contribution_amount_cents: 500)
    fund_two = Fund.create!(id: 24, contribution_amount_cents: 500)
    year = Year.new(dues_cents: 2500)

    questionaire = Questionaire.new(
      year: year,
      contributing_fund_ids: [fund_one.id, fund_two.id]
    )

    payment = Payment.new(questionaire: questionaire)

    expected = 25 + 5 + 5 + 1.35

    assert_equal 36.35, payment.amount_dollars,
      "It returns amount cents in dollars"
  end
end
