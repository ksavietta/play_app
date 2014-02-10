class PlaysController<ApplicationController

  def index
    @plays = Play.all
    @play = Play.new
  end

  def show
    @play = Play.find(params[:id])
    @roles = Role.order(params[:sort] + ' ' + params[:direction])
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

end