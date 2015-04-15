class InterviewsController < ApplicationController
  def index
    @you_tube_videos = YouTube::Video.all.page(params[:page])
  end

  def show
    @you_tube_video = YouTube::Video.find_by(id: params[:id])
  end
end
