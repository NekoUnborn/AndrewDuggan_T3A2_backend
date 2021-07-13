class RewardsController < ApplicationController
  #  before_action :authenticate
  before_action :set_reward, only: %i[show create update destroy]

  def index
    render json: Reward.all
  end

  def show
    render json: @reward
  end

  def create
    render json: Reward.create(reward_params), status: :created
  end

  def update
    if @reward.update(reward_params)
      render json: @reward
    else
      render json: { error: 'Failed to update reward' }
    end
  end

  def destroy
    if @reward.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy reward' }, status: :unprocessable_entity
    end
  end

  private

  def set_reward
    @reward = Reward.find(params[:id])
  end

  def rewards_params
    params.permit(:param1, :param2)
  end
end