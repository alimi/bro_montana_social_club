require 'test_helper'

class FundTest < ActiveSupport::TestCase
  test "#contribution_amount_dollars when contribution_amount_cents is set" do
    fund = Fund.new(contribution_amount_cents: 555)

    assert_equal 5.55, fund.contribution_amount_dollars,
      "It returns the contribution amount in dollars"
  end

  test "#contribution_amount_dollars when contribution_amount_cents is not set" do
    fund = Fund.new(contribution_amount_cents: nil)

    assert_equal 0, fund.contribution_amount_dollars,
      "It returns zero"
  end

  test "#contribution_amount_dollars=" do
    fund = Fund.new

    fund.contribution_amount_dollars = 10.22

    assert_equal 1022, fund.contribution_amount_cents,
      "It save the new contribution amount dollars as contribution_amount_cents"
  end
end
