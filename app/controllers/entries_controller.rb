class EntriesController < ApplicationController
  before_action :logged_in_user, only: [:create, :destroy]
  before_action :correct_user,   only: :destroy
  before_action :setEntry
  
  def create
   @entry = current_user.entry.build(entry_params)
   if @entry.save
   flash[:success] = "Entry created!"
    redirect_to root_url
    else
      @feed_items = []
      render 'static_pages/home'
    end
  end
  
  def show
    @comments = Comment.where(entry_id: @entry).order("created_at DESC")
  end
  
  def destroy
    @entry.destroy
    flash[:success] = "Micropost deleted"
    redirect_to request.referrer || root_url
  end
  
  private
   
    def entry_params
      params.require(:entry).permit(:content, :picture)
    end
    
    def setEntry
      @entry = Entry.find(params[:id])
    end
    
    def correct_user
      @entrys = current_user.entry.find_by(id: params[:id])
      redirect_to root_url if @entrys.nil?
    end
    
end
