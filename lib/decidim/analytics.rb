# frozen_string_literal: true

require "decidim/analytics/admin"
require "decidim/analytics/engine"
require "decidim/analytics/admin_engine"

module Decidim
  # This namespace holds the logic of the `Analytics` component. This component
  # allows users to create analytics in a participatory space.
  module Analytics
    include ActiveSupport::Configurable

    config_accessor :matomo_server_address do
      ENV.fetch("MATOMO_SERVER_ADDRESS", nil)
    end

    config_accessor :matomo_site_id do
      ENV.fetch("MATOMO_SITE_ID", nil)
    end

    config_accessor :matomo_token_auth do
      ENV.fetch("MATOMO_TOKEN_AUTH", nil)
    end
  end
end
