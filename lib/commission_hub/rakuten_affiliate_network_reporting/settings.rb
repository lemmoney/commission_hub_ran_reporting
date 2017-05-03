module CommissionHub
  module RakutenAffiliateNetworkReporting
    class Settings
      attr_accessor :base_uri, :username, :password, :scope, 
      :client_id, :authorization_basic_auth, :authorization_bearer_token, :report_token
    end
  end
end
