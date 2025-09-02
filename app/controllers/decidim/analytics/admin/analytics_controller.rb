# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      class AnalyticsController < Analytics::Admin::ApplicationController
        def index
          @server_address = Decidim::Analytics.matomo_server_address
          @site_id = Decidim::Analytics.matomo_site_id
          @token_auth = Decidim::Analytics.matomo_token_auth
        end
      end
    end
  end
end
