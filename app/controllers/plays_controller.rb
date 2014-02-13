class PlaysController<ApplicationController
  helper_method :sort_column, :sort_direction

  def index
    @plays = Play.all
    @play = Play.new
  end

  def show
    @play = Play.find(params[:id])
    @roles = @play.roles.order(sort_column + ' ' + sort_direction)
  end

  def create
    @play = Play.new(play_params)
    if @play.analyze_and_save
      flash[:notice] = "Your play has been successfuly created!"
      redirect_to plays_path
    else
      flash[:notice] = "Something went wrong!"
      redirect_to plays_path
    end
  end

  private

  def play_params
    params.require(:play).permit(:name, :xml)
  end

  # helper methods for default sort A-Z on role name
  def sort_column
    params[:sort] || "name"
  end

  def sort_direction
    params[:direction] || "asc"
  end

end