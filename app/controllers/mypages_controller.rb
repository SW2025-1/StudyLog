class MypagesController < ApplicationController
  before_action :enable_sidebar

  def show
    @user = current_user

    @studytime_by_subject =
      @user.logs
           .joins(:subject)
           .group('subjects.id', 'subjects.subject_name')
           .sum(:studytime)
  end
end
