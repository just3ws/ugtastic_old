class InterviewsController < ApplicationController
  def index
    @you_tube_videos = YouTube::Video.includes(:conference).joins(:interviewees).published.order(id: 'asc') # .page(params[:page])
  end

  def show
    @you_tube_video = YouTube::Video.friendly.find(params[:id])
  end
end
