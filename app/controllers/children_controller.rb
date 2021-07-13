class ChildrenController < ApplicationController
#  before_action :authenticate
  before_action :set_child, only: %i[show create update destroy]

  def index
    render json: Child.where(user_id: params)
  end

  def show
    render json: @child
  end

  def create
    render json: Child.create(child_params), status: :created
  end

  def update
    if @child.update(child_params)
      render json: @child
    else
      render json: { error: 'Failed to update child' }
    end
  end

  def destroy
    if @child.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy child' }, status: :unprocessable_entity
    end
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.permit(:param1, :param2)
  end
end
