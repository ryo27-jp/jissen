class ApplicationController < ActionController::Base
  # レイアウトを決定する為のメソッドを指定
  layout :set_layout

  class Forbidden < ActionController::ActionControllerError; end
  class IpAddressRejected < ActionController::ActionControllerError; end

  include ErrorHandlers if Rails.env.production?
  
  private 

    def set_layout
      if params[:controller].match(%r{\A(staff|admin|customer)/})
        Regexp.last_match[1]
      else
        "customer"
      end
    end

end
