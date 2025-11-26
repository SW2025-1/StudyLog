class NotesController < ApplicationController
  def index
    @notes = Note.all
  end
  
  def new
    @note = Note.new
  end
  
  def create
    note = Note.new(user_id: nil, title: params[:note][:title], content: params[:note][:content])
    note.save
    redirect_to '/'
  end
  
  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to '/'
  end
  
end
