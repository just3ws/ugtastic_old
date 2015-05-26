class ConferencesController < ApplicationController
  def index
    @conferences = Conference.all
  end

  def show
    @conference = Conference.friendly.find(params[:id])
    @header_title = "#{@conference.name} Interviews"
    @interviews = @conference.interviews

    render 'interviews/index'
  end
end
