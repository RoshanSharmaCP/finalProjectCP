class ApplicationController < ActionController::Base
    before_action :authenticate_request
    attr_reader :current_author
    
    def allow_cors
        headers['Access-Control-Allow-Origin'] = '*'
        headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, OPTIONS'
        headers['Access-Control-Allow-Headers'] = 'Origin, Content-Type, Accept, Authorization, Token'
    end

  private

  def authenticate_request
    @current_author = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_author
  end

end
