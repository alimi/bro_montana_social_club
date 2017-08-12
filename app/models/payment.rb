class Payment
  include Rails.application.routes.url_helpers

  attr_reader :questionaire

  def initialize(questionaire:)
    @questionaire = questionaire
  end

  def external_url
    payment_provider.external_url(
      amount_dollars: amount_dollars,
      description: "Annual Dues and Fund Contributions",
      redirect_url: questionaire_payment_url(questionaire, host: "localhost:3000")
    )
  end

  def amount_dollars
    amount_cents / 100.0
  end

  def amount_cents
    questionaire.dues_cents + questionaire.fund_contribution_cents
  end

  def dues_dollars
    questionaire.dues_cents / 100.0
  end

  def fund_contribution_dollars
    questionaire.fund_contribution_cents / 100.0
  end

  def calendar_year
    questionaire.calendar_year
  end

  private

  def payment_provider
    WepayPaymentProvider.new
  end
end
