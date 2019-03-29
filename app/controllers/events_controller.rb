class EventsController < ApplicationController
before_action :find_event, only: [:show, :edit, :update, :destroy, :terminate]


  def terminate
  @event.update(end_time: Time.now)
  redirect_to current_user
    # since youre editing in the user show, this just refreshes the page
  end

  def index
    @events = Event.where.not(latitude: nil, longitude: nil)
    @markers = @events.map do |event|
      {
        title: event.title,
        lat: event.latitude,
        lng: event.longitude,
        description: event.description,
        picture: event.picture,
        comment_link: event_comments_path(event),
        end_time: event.end_time,
        user_id: event.user_id,
        username: event.id
      }
    end

    if params[:query].present?
      @events = Event.global_search(params[:query]).order(end_time: :asc)
    else
      @events = Event.order(end_time: :asc)
    end

    # must be able to make new comments in the show
    @comment = Comment.new
    @event = Event.new

    @events = policy_scope(Event)
  end

  def show
    authorize @event
  end

  def destroy
    authorize @event
    @event.destroy
    redirect_to current_user
      # since youre editing in the user show, this just refreshes the page
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event

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

  def edit
    authorize @event
  end

  def update
    authorize @event
    @event.update(event_params)
  end

  private

  def event_params
    params.require(:event).permit(:title, :description, :end_time, :start_time, :picture, :latitude, :longitude)
  end



  def find_event
    @event = Event.find(params[:id])
     authorize @event
  end


end


