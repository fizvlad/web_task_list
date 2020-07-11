class ApplicationController < ActionController::API
    after_action :cors_set_access_control_headers

    def cors_preflight_check
      if request.options?
        cors_set_access_control_headers
        render plain: ''
      end
    end

    private

    def cors_set_access_control_headers
      response.headers['Access-Control-Allow-Origin'] = '*'
      response.headers['Access-Control-Allow-Methods'] = 'POST, GET, PUT, PATCH, DELETE, OPTIONS'
      response.headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept'
      response.headers['Access-Control-Max-Age'] = '1728000'
    end
end
