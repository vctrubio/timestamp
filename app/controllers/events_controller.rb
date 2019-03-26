class EventsController < ApplicationController
before_action :find_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all
    # must be able to make new comments in the show
    @comment = Comment.new
  end

  def show
  end
 

  
  def destroy
    @event.destroy
    #redirect to
  end
  
  def new
    @event = Event.new
  end
  
  def create
    @event_create = Event.new(event_params)
    @event_create.user = current_user
    @start_time_default = Time.now
    @end_time_default = @start_time_default + 86400
    #if end_time param nil? provide defualt end time 24hrs
      if @event.save
        redirect_to root_path
      else
        render :new
      end
      
  end

  def update
    @event.update(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :end_time, :start_time, :picture)
  end

  #user_id not passed


  def find_event
    @event = Event.find(params[:id])
    # authorize @event
  end


end


