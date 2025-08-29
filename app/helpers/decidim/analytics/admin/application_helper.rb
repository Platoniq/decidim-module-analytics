# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      module ApplicationHelper
        def matomo_dashboard_url
          config = Decidim::Analytics.matomo
          return "#" if config.values_at(:server_address, :site_id, :token_auth).any?(&:blank?)

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
