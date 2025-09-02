# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      module ApplicationHelper
        def matomo_dashboard_url
          server_address = Decidim::Analytics.matomo_server_address
          site_id = Decidim::Analytics.matomo_site_id
          token_auth = Decidim::Analytics.matomo_token_auth

          return "#" if [server_address, site_id, token_auth].any?(&:blank?)

          params = {
            module: "Widgetize",
            action: "iframe",
            moduleToWidgetize: "Dashboard",
            actionToWidgetize: "index",
            idSite: config[:site_id],
            period: "week",
            date: "yesterday",
            token_auth: config[:token_auth]
          }

          "#{config[:server_address]}/index.php?#{params.to_query}"
        end
      end
    end
  end
end
