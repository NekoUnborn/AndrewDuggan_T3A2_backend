# This class is for the rendering of the child information
class ChildrenController < ApplicationController
  before_action :authenticate
  before_action :set_child, only: %i[show update destroy child_checklist_entries]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

  def index
    @children = User.where(username: @username).first.child
    render json: @children
  end

  def show
    render json: @child
  end

  def create
    @child = Child.new(name: params[:name], user_id: User.where(username: @username).first.id)
    if @child.save
      params[:formMeds].each do |medicine|
        @entry = ChecklistEntry.new(child_id: @child.id,
                                    medicine_id: Medicine.where(name: medicine[:medicine]).first.id, complete: false, time: medicine[:time])
        if !@entry.save
          render json: { message: 'CheckList failed Creation' }
        end
      end
    end
    render json: { id: @child.id, user_id: User.where(username: @username).first.id }
  end

  def update
    # If a checklist entry already exists with the given medicine id, then set
    @checklist = @child.checklist_entries
    @checklist.destroy_all
    params[:formMeds].each do |medicine|
      @entry = ChecklistEntry.new(child_id: @child.id, medicine_id: Medicine.where(name: medicine[:medicine]).first.id,
                                  complete: false, time: medicine[:time])
      if @entry.save
        render json: { message: 'CheckList successfully Updated' , }
      else
        render json: { message: 'CheckList failed Update' }
      end
    end
  end

  def destroy
    if @child.destroy
      render status: :no_content
    else
      render json: { error: 'Failed to destroy child' }, status: :unprocessable_entity
    end
  end

  # This function finds the children of the param'ed User
  def users_children
    render json: Child.where(user_id: params[:user_id])
  end

  # This function retrieves all of the checklist entries for the param'ed child
  # It renders an array of the entries
  def child_checklist_entries
    @entries = @child.checklist_entries
    @package = []
    @entries.each do |entry|
      entry[:complete] = false if entry[:last_accessed] != Date.current
      @package.push({
                      checklist_entry_id: entry.id,
                      medicine_id: entry.medicine_id,
                      medicine: entry.medicine.name,
                      description: entry.medicine.description,
                      time: entry.time.strftime("%I:%M"),
                      complete: entry.complete
                    })
    end
    render json: @package
  end

  private

  def set_child
    @child = Child.find(params[:id])
  end

  def child_params
    params.permit(:user_id, :name)
  end
end
