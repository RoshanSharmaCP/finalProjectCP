class AuthorizeApiRequest
    prepend SimpleCommand
  
  def initialize(headers = {})
      @headers = headers
    end
  
    def call
      author
    end
  
    private
  
    attr_reader :headers
  
    def author
      @author ||= Author.find(decoded_auth_token[:author_id]) if decoded_auth_token
      @author || errors.add(:token, 'Invalid token') && nil
    end
  
    def decoded_auth_token
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
    end
  
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
      else
        errors.add(:token, 'Missing token')
      end
      nil
    end
  end
