class UsersController < ApplicationController
  before_action :authenticate, only: %i[show update destroy]
  before_action :set_user, only: %i[show update destroy]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

  # This function checks if the User exists by the username and if so, checks the password.
  # If both match the db, it renders the token
  def login
    @user = User.find_by_username(user_params[:username])
    if @user && @user.authenticate(user_params[:password])
      set_token
    else
      render json: { error: 'Username or password incorrect' }, status: :unauthorized
    end
  end

  def signup
    @user = User.create(user_params)
    set_token
  end

  def index
    render json: User.all
  end

  def show
    render json: @user
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

  # This function retrieves the all of the checklist entries for the User and displays the out of date ones.
  # This is for the reminders function
  def reminders
    @checklist_entries = []
    @user.child.each do |child|
      child.checklist_entries.each do |entry|
        next unless entry.time.strftime("%I:%M:%S") < Time.now.strftime("%I:%M:%S")

        @checklist_entries.push({
                                  child_name: entry.child.name,
                                  medicine: entry.medicine.name,
                                  time: entry.time
                                })
      end
    end
    render json: @checklist_entries
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_token
    payload = { username: @user.username, email: @user.email, pin: @user.pin, exp: Time.now.to_i + (4 * 3600) }
    token = JWT.encode(payload, @@jwt_secret, 'HS512')
    render json: { token: token }
  end

  def user_params
    params.permit(:username, :email, :password, :pin)
  end
end
