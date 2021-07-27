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

  # If all of the checklist entries are complete, this function will also create a reward for the child
  def update
    if @checklist_entry.update(complete: params[:complete])
      child = @checklist_entry.child
      list_verify = []
      child.checklist_entries.each do |entry|
        list_verify.push(entry.complete)
      end
      if !list_verify.include?(false) && Time.now.day != child.rewards.last.date.day
        child.rewards.create(date: Time.now)
        render json: {medicine: @checklist_entry.medicine , time: @checklist_entry.time , complete: @checklist_entry.complete, id: @checklist_entry.id}
      else 
        render json: {medicine: @checklist_entry.medicine , time: @checklist_entry.time , complete: @checklist_entry.complete, id: @checklist_entry.id}
      end 
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

  private

  def set_checklist_entry
    @checklist_entry = ChecklistEntry.find(params[:id])
  end

  def checklist_entry_params
    params.permit(:child_id, :time, :medication_id, :complete, :last_accessed, :current_date)
  end
end
