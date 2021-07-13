class UsersController < ApplicationController
  #  before_action :authenticate
  before_action :set_user, only: %i[show create update destroy]

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

  private

  def set_user
    @user = User.find(params[:id])
  end

  def users_params
    params.permit(:param1, :param2)
  end
end
