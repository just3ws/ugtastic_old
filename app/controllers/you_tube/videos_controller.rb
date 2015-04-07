module YouTube
  class VideosController < ApplicationController
    before_action :set_you_tube_video, only: %i(show)

    def index
      @you_tube_videos = YouTube::Video.all.page(params[:page])
    end

    def show
    end

    private

    def set_you_tube_video
      @you_tube_video = YouTube::Video.find_by(id: params[:id])
    end
  end
end
