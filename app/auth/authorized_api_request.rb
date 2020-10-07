class AuthorizedApiRequest
  def initialize(headers = {})
    @headers = headers
  end

  def call
    { user: user }
  end

  private

  attr_reader :headers

  def user
    @user ||= User.find(decode_auth_token[:user_id]) if decode_auth_token
  rescue ActiveRecord::RecordNotFound => e
    raise(ExceptionHandler::InvalidToken, ("Invalid Token, #{e.message}"))
  end

  def decode_auth_token
    @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
  end

  def http_auth_header
    if headers['Authorization'].present?
      return headers['Authorization'].split(' ').last
    end
    raise(ExceptionHandler::MissingToken, /Token missing/)
  end
end
