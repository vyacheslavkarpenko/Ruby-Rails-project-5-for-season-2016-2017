module UsersHelper
  def authenticateAndGetUserOrThrow401
    user = nil
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by(auth_token: token)
    end
    user
  end
end
