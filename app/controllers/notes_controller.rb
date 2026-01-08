class NotesController < ApplicationController
  before_action :enable_sidebar
  
  def index
    @notes = Note.where(user_id: current_user.id)
  end
  
  def new
    @note = Note.new
  end
  
  def create
    @note = Note.new(note_params)
    @note.user_id = current_user.id
    if @note.save
      redirect_to notes_path
    else
      render :new, status: :unprocessable_entity
    end
  end
  
  def destroy
    note = Note.find(params[:id])
    note.destroy
    redirect_to notes_path
  end
  
  def show
    @note = Note.find(params[:id])
  end
  
  def edit
    @note = Note.find(params[:id])
  end
  
  def update
    @note = Note.find(params[:id])
    if @note.update(note_params)
      redirect_to notes_path
    else
      render :edit, status: :unprocessable_entity
    end
  end
  
  
  private
  
  def note_params
    params.require(:note).permit(:title, :content, images: [])
  end
  
end
