# This class is for the rendering of the child information
class ChildrenController < ApplicationController
  before_action :authenticate
  before_action :set_child, only: %i[show update destroy]

  rescue_from Exception do |e|
    render json: { error: e }, status: :not_found
  end

  def index
    @user = User.where(username: @username)
    render json: @user.first.child
  end

  def show
    @entries = @child.checklist_entries
    @package = []
    @entries.each do |entry|
      medicine = entry.medicine
      @package.push({ medicine: medicine.name, discription: medicine.discription, time: entry.time })
    end
    render json: @package
  end

  def create
    @child = Child.new(name: params[:name], user_id: User.where(username: @username).first.id)
    if @child.save
      params[:formMeds].each do |medicine|
        @entry = ChecklistEntry.new(child_id: @child.id,
                                    medicine_id: Medicine.where(name: medicine[:medicine]).first.id, complete: false, time: medicine[:time])
        if @entry.save
          render json: { message: 'CheckList successfully Created' }
        else
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
        render json: { message: 'CheckList successfully Updated' }
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
