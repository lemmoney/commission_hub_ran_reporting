module CommissionHub
  module RakutenAffiliateNetworkReporting
    class Connection < CommissionHub::Connection

      def_endpoint :reports, "en/reports", class: :Base
      
      def initialize(settings)
        @settings = settings
      end

    end
  end
end

