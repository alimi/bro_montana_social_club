module Authenticable
  extend ActiveSupport::Concern

  included do
    http_basic_authenticate_with(
      name: "commish",
      password: Rails.application.secrets.commish_password
    )
  end
end
