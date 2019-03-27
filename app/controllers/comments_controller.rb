class CommentsController < ApplicationController
  before_action :set_event, only: [:index, :create, :new]

  def index
    @comment = Comment.new
    @comments = @event.comments
    #@user = current_user - will use for profile pic in later update
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.event = @event
    if @comment.save!
      redirect_to event_comments_path
    end
  end


  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
