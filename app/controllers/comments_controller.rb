class CommentsController < ApplicationController
  before_action :set_event, only: [:index, :create, :new, :show]

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

  private

  def set_event
    @event = Event.find(params[:event_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
