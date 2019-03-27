class CommentsController < ApplicationController
  before_action :set_event, only: [:create, :new]

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.user = current_user
    @comment.event = @event
    if @comment.save!
      redirect_to user_event_path(@comment)
    else
      redirect_to user_event_path(@comment)
    end
  end


  private

  def set_event
    @event = Event.find(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end
end
