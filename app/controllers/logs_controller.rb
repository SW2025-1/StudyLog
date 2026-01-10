class LogsController < ApplicationController
  before_action :enable_sidebar
  
  def index
    @logs = current_user.logs.includes(:subject)
  end

  def new
    @log = Log.new
  end
  
  def create
    @log = current_user.logs.new(log_params)
    if @log.save
      redirect_to logs_path
    else
      render :new
    end
  end

  def destroy
    @log = Log.find(params[:id])
    @log.destroy
    redirect_to logs_path
  end
  
  def show
    @log = Log.find(params[:id])
  end
  
  def edit
    @log = Log.find(params[:id])
  end
  
  private
  def log_params
    params.require(:log).permit(:subject_id, :studytime, :memo, :studied_on)
  end

end
