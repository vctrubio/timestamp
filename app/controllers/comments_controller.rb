class CommentsController < ApplicationController

  before_action :set_comment, only: [:destroy]
  before_action :set_event, only: [:index, :create, :new]



  def index
    @comment = Comment.new
    @comments = @event.comments
    @comments = policy_scope(Comment)

    #@user = current_user - will use for profile pic in later update
  end
 
  def new
    @comment = Comment.new
    authorize @comment
  end


  def create
    @comment = Comment.new(comment_params)
    authorize @comment
    @comment.user = current_user
    @comment.event = @event
    if @comment.save!
      redirect_to event_comments_path
    end
  end

  def destroy
    @event = @comment.event
    @comment.destroy
    redirect_to event_comments_path(@event)
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_event
    @event = Event.find(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
