require 'test_helper'

class DuesTest < ActiveSupport::TestCase
  test "#amount_dollars when amount_cents is set" do
    dues = Dues.new(amount_cents: 555)

    assert_equal 5.55, dues.amount_dollars,
      "It returns amount_cents in dollars"
  end

  test "#amount_dollars when amount_cents is not set" do
    dues = Dues.new

    assert_equal 0, dues.amount_dollars,
      "It returns zero"
  end

  test "#amount_dollars= when the new amount is string" do
    dues = Dues.new

    dues.amount_dollars = "15.55"

    assert_equal 1555, dues.amount_cents,
      "It saves the new amount in cents as amount_cents"
  end

  test "#amount_cents" do
    dues = Dues.new

    assert dues.respond_to?(:amount_cents),
      "It responds to #amount_cents"
  end

  test "#amount_cents=" do
    dues = Dues.new

    assert dues.respond_to?(:amount_cents=),
      "It responds to #amount_cents="
  end
end
