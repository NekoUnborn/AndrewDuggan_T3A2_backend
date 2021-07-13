class ChecklistsController < ApplicationController
  #  before_action :authenticate
  before_action :set_checklist, only: %i[show create update destroy]

  def index
    render json: Checklist.where(child_id: params[child_id]).order(time: :asc)
  end

  def show
    render json: @checklist
  end

  def create
    render json: Checklist.create(checklist_params), status: :created
  end

  def update
    if @checklist.update(checklist_params)
      render json: @checklist
    else
      render json: { error: 'Failed to update checklist' }
    end
  end

  def destroy
    if @checklist.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy checklist' }, status: :unprocessable_entity
    end
  end

  private

  def set_checklist
    @checklist = Checklist.find(params[:id])
  end

  def checklist_params
    params.permit(:child_id, :time, :medication_id, :complete, :last_accessed)
  end
end
