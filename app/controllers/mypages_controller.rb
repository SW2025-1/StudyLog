class MypagesController < ApplicationController
  before_action :enable_sidebar

  def show
    @user = current_user

    @studytime_by_subject =
      @user.logs
           .joins(:subject)
           .group('subjects.id', 'subjects.subject_name')
           .sum(:studytime)
           
    @studytime_by_month =
      @user.logs
           .group_by_month(:studied_on, format: "%Y-%m")  # "2025-12" のようなキー
           .sum(:studytime)
           
    count_of_logs = 2
    @recent_logs = @user.logs.order(studied_on: :desc).limit(count_of_logs) #日付的に近いログを指定個数表示
    
  end
end
