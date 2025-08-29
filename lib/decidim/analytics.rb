# frozen_string_literal: true

require "decidim/analytics/admin"
require "decidim/analytics/engine"
require "decidim/analytics/admin_engine"

module Decidim
  # This namespace holds the logic of the `Analytics` component. This component
  # allows users to create analytics in a participatory space.
  module Analytics
    autoload :Engine, "decidim/analytics/engine"

    include ActiveSupport::Configurable

    # Configuración para Matomo
    def self.matomo
      @matomo ||= {
        enabled: ENV["MATOMO_SITE_ID"].present? || Rails.application.secrets.dig(:matomo, :enabled),
        server_address: ENV.fetch("MATOMO_SERVER_ADDRESS", Rails.application.secrets.dig(:matomo, :server_address)),
        site_id: ENV.fetch("MATOMO_SITE_ID", Rails.application.secrets.dig(:matomo, :site_id)),
        token_auth: ENV.fetch("MATOMO_TOKEN_AUTH", Rails.application.secrets.dig(:matomo, :token_auth))
      }
    end
  end
end
