module CommissionHub
  module RakutenAffiliateNetworkReporting
    module ApiAccess
      
      private
      
      def full_uri
        "#{connection.settings.base_url}/#{base_uri}"
      end

      def report_token
        connection.settings.report_token
      end

    end
  end
end
