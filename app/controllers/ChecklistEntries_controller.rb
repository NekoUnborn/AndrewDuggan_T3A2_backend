  #  before_action :authenticate
  before_action :set_checklist_entry, only: %i[show create update destroy]

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

  private

  def set_checklist_entry
    @checklist_entry = Checklist_entry.find(params[:id])
  end

  def checklist_entry_params
    params.permit(:param1, :param2)
  end
end
