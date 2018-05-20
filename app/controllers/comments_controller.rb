class CommentsController < ApplicationController
  before_action :find_entry
  
  def create
      @comment = @entry.comments.create(comment_params);
      @comment.user_id = current_user.id
      if @comment.save
         flash[:info] = "Success"
          redirect_to root_url
      else
        render 'entries/show'
      end
  end
  
  private
  
  def comment_params
      params.require(:comment).permit :content
  end
  
  def find_entry
      @entry = Entry.find(params[:entry_id])
  end
end
