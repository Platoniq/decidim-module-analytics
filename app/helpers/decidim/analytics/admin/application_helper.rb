# frozen_string_literal: true

module Decidim
  module Analytics
    module Admin
      module ApplicationHelper
        def matomo_dashboard_url
          config = Decidim::Analytics.matomo
          return "#" if config[:server_address].blank? || config[:site_id].blank? || config[:token_auth].blank?

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
