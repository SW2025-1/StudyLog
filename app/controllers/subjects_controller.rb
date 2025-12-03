class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def new
    @subject = Subject.new
  end

  def create
    subj = Subject.new(subject_name: params[:subject][:subject_name])
    subj.save
    redirect_to subjects_path
  end

  def edit
  end
end
