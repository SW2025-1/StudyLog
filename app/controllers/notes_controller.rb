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
    redirect_to notes_path
  end
  
  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to notes_path
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
end
