class ChildrenController < ApplicationController
  before_action :authenticate
  before_action :set_child, only: %i[show update destroy]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

  def index
    @user = User.where(username: @username)
    render json: @user.first.child.pluck(:name, :id)
  end

  def show
    render json: @child.checklist_entries
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

  def users_children
    render json: Child.where(user_id: params[:user_id])
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.permit(:user_id, :name)
  end
end
