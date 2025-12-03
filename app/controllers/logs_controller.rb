class LogsController < ApplicationController
  def index
    @log = Log.all
  end

  def new
    @log = Log.new
  end
  
  def create
    logs = Log.new(user_id: 1, subject_id: 1, studytime: params[:log][:studytime], memo: params[:log][:memo], studied_on: params[:log][:studied_on])
    logs.save
    redirect_to logs_path
  end

  def destroy
    logs = Log.find(params[:id])
    logs.destroy
    redirect_to logs_path
  end
  
  def show
    @log = Log.find(params[:id])
  end
  
  def edit
    @log = Log.find(params[:id])
  end
end
