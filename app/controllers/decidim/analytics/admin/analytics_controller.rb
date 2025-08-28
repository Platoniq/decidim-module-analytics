# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      class AnalyticsController < Analytics::Admin::ApplicationController
        def index
          @server_address = env_or_secret("DECIDIM_ANALYTICS_MATOMO_SERVER_ADDRESS", :server_address)
          @site_id = env_or_secret("DECIDIM_ANALYTICS_MATOMO_SITE_ID", :site_id)
          @token_auth = env_or_secret("DECIDIM_ANALYTICS_MATOMO_TOKEN_AUTH", :token_auth)
        end

        private

        def env_or_secret(env_key, secret_key)
          value = ENV.fetch(env_key, nil)
          return value unless value.nil? || value == ""

          Rails.application.secrets.dig(:matomo, secret_key)
        end
      end
    end
  end
end
