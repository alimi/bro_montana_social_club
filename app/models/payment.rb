class Payment
  include Rails.application.routes.url_helpers

  attr_reader :questionaire, :error

  def initialize(questionaire:)
    @questionaire = questionaire
    @error = nil
  end

  def process(payment_method_id)
    Stripe.api_key ||= Rails.application.secrets.stripe_secret_key

    intent = Stripe::PaymentIntent.create(
      amount: amount_cents,
      currency: "usd",
      payment_method: payment_method_id,
      confirm: true
    )

    questionaire.update!(paid_at: DateTime.current, payment_token: intent.id)
  rescue Stripe::CardError => e
    @error = e.error.message
    false
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
end
