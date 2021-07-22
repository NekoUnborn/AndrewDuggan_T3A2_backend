class UsersController < ApplicationController
  # before_action :authenticate
  before_action :set_user, only: %i[show update destroy]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

    def login
      @user = User.find_by_username(user_params[:username])
      if @user && @user.password_digest == user_params[:password]
        @payload = { username: @user.username, email: @user.email, pin: @user.pin, exp: Time.now.to_i + (4 * 3600) }
        @token = JWT.encode(@payload, @@jwt_secret, 'HS512')
        render json: { token: @token }
      else
        render json: { error: 'Username or password incorrect' }, status: :unauthorized
      end
    end

  def signup
    render json: User.create(user_params), status: :created
    redirect_to login_path
  end

  def index
    render json: User.all
  end

  def show
    begin
    render json: @user
    rescue Exception
    end
  end

  def create
    render json: User.create(user_params), status: :created
  end

  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: { error: 'Failed to update user' }
    end
  end

  def destroy
    if @user.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy user' }, status: :unprocessable_entity
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:username, :email, :password, :pin)
  end
end
