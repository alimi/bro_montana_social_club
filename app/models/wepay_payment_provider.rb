class WepayPaymentProvider
  def external_url(amount_dollars:, description:, redirect_url:)
    response = api_client.call("/checkout/create", access_token, {
      account_id: account_id,
      amount: amount_dollars,
      short_description: description,
      type: "personal",
      currency: "USD",
      fee_payer: "payee",
      redirect_uri: redirect_url
    })

    response.fetch("checkout_uri")
  end

  private

  def account_id
    Rails.application.secrets.wepay_account_id
  end

  def access_token
    Rails.application.secrets.wepay_access_token
  end

  def api_client
    @api_client ||= WePay::Client.new(
      Rails.application.secrets.wepay_client_id,
      Rails.application.secrets.wepay_client_secret,
      !Rails.env.production?
    )
  end
end
