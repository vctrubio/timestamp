class EventsController < ApplicationController
before_action :find_event, only: [:show, :update, :destroy]

  def index
    @events = Event.all

    # must be able to make new comments in the show
    @comment = Comment.new
    @event = Event.new
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
    @event = Event.new(event_params)
    @event.user = current_user
    
    @start_time = Time.now
    @event.start_time = @start_time

    # Get the end time from user or assign default
    if  params["event"]["end_time"].empty?
      @end_time_variable = @start_time + 86400
    else
      @end_time_variable = @start_time + (params["event"]["end_time"].to_i * 3600)
    end

     @event.end_time = @end_time_variable
     
     
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


