module UsersHelper
  def authenticate_user_or_throw_error
    user = nil
    authenticate_or_request_with_http_token do |token, _|
      user = User.find_by(auth_token: token)
    end
    user
  end

  def self.authorize(api_controller)
    header = api_controller.headers['Authorization']
    return unless header
    token = header[7..header.length]
    user = User.find_by(auth_token: token)
    return api_controller.error!('Unauthorized', 401) unless user
    user
  end
end
