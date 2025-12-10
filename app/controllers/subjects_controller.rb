class SubjectsController < ApplicationController
  before_action :enable_sidebar
  
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    subj = Subject.new(subject_params)
    if subj.save
      redirect_to subjects_path
    else
      render :new, status: :unprocessable_entity 
    end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])
    if @subject.update(subject_params)
      redirect_to subjects_path, notice: "科目を更新しました"
    else
      render :edit, status: :unprocessable_entity
    end
  end
    
  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy
    redirect_to subjects_path, notice: "科目を削除しました"
  end  

  private
  def subject_params
    params.require(:subject).permit(:subject_name)
  end
end
