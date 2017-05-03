module CommissionHub
  module RakutenAffiliateNetworkReporting
    module Endpoints
      class Base < CommissionHub::Endpoint
        
        include CommissionHub::RakutenAffiliateNetworkReporting::ApiAccess

        def call(request_params={})
          request_params = request_params.merge({token: report_token})
          connection.class.get("#{full_uri}?#{to_query_string(request_params)}")
        end

        private

        def to_query_string(request_params)
          request_params.map do |k,v|
            "#{k}=#{v}"
          end.join("&").chomp("&")
        end

      end
    end
  end
end

