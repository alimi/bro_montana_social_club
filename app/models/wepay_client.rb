class WepayClient
  def self.get_checkout_uri_for_iframe_payment(amount, short_description, redirect_uri)
    self.new.get_checkout_uri_for_iframe_payment(
      amount, short_description, redirect_uri)
  end

  def get_checkout_uri_for_iframe_payment(amount, short_description, redirect_uri)
    options = default_options.merge({
      amount: amount,
      short_description: short_description,
      redirect_uri: redirect_uri
    })

    wepay_api_response = wepay_api.call(
      '/checkout/create',
      Rails.application.secrets.wepay_access_token,
      options
    )

    wepay_api_response['checkout_uri']
  end

  private

  def default_options
    {
      account_id: Rails.application.secrets.wepay_account_id,
      type: 'service',
      fee_payer: 'payer',
      mode: 'iframe'
    }
  end

  def wepay_api
    return @wepay_api if defined? @wepay_api

    @wepay_api = WePay.new(
      Rails.application.secrets.wepay_client_id,
      Rails.application.secrets.wepay_access_token,
      !Rails.env.production?
    )
  end
end
