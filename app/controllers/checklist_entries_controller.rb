class ChecklistEntriesController < ApplicationController
  before_action :authenticate
  before_action :set_checklist_entry, only: %i[show update destroy]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

  def index
    render json: Checklist_entry.all
  end

  def show
    render json: @checklist_entry
  end

  def create
    render json: Checklist_entry.create(checklist_entry_params), status: :created
  end

  def update
    if @checklist_entry.update(checklist_entry_params)
      render json: @checklist_entry
    else
      render json: { error: 'Failed to update checklist_entry' }
    end
  end

  def destroy
    if @checklist_entry.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy checklist_entry' }, status: :unprocessable_entity
    end
  end

  def child_checklist_entries
    @entries = ChecklistEntry.where(child_id: user_params[:child_id])
    @entries.each do |entry|
      entry[:completed] = false if entry[:date] != user_params[:current_date]
    end
    render json: @entries
  end

  private

  def set_checklist_entry
    @checklist_entry = Checklist_entry.find(params[:id])
  end

  def checklist_entry_params
    params.permit(:child_id, :time, :medication_id, :complete, :last_accessed, :current_date)
  end
end
