module UsersHelper
  def authenticateAndGetUserOrThrow401
    user = nil
    authenticate_or_request_with_http_token do |token, options|
      user = User.find_by(auth_token: token)
    end
    user
  end

  def self.authorize(api_controller)
    header = api_controller.headers['Authorization']
    if header
      token = header[7..header.length]
      user = User.find_by(auth_token: token)
      if user == nil
        api_controller.error!('Unauthorized', 401)
      end
      user
    else
      api_controller.error!('Unauthorized', 401)
    end
    user
  end
end
