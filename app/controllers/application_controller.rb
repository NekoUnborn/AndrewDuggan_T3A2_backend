class ApplicationController < ActionController::API
  @@jwt_secret = ENV['JWT_SECRET_KEY']

  # this function is used to ensure that the user has a valid token for their login
  def authenticate
    token = request.headers["Authorization"].split(' ')[1]
    payload = JWT.decode(token, @@jwt_secret, true, { algorithm: 'HS512' })[0]
    @username = payload["username"]
  rescue StandardError
    render json: { error: "Invalid token" }, status: :unauthorized
  end
end
