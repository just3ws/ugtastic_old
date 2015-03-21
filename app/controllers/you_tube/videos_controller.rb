class YouTube::VideosController < ApplicationController
  before_action :set_you_tube_video, only: [:show, :edit, :update, :destroy]

  # GET /you_tube/videos
  # GET /you_tube/videos.json
  def index
    @you_tube_videos = YouTube::Video.all.page(params[:page])
  end

  # GET /you_tube/videos/1
  # GET /you_tube/videos/1.json
  def show
  end

  # GET /you_tube/videos/new
  def new
    @you_tube_video = YouTube::Video.new
  end

  # GET /you_tube/videos/1/edit
  def edit
  end

  # POST /you_tube/videos
  # POST /you_tube/videos.json
  def create
    @you_tube_video = YouTube::Video.new(you_tube_video_params)

    respond_to do |format|
      if @you_tube_video.save
        format.html { redirect_to @you_tube_video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @you_tube_video }
      else
        format.html { render :new }
        format.json { render json: @you_tube_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /you_tube/videos/1
  # PATCH/PUT /you_tube/videos/1.json
  def update
    respond_to do |format|
      if @you_tube_video.update(you_tube_video_params)
        format.html { redirect_to @you_tube_video, notice: 'Video was successfully updated.' }
        format.json { render :show, status: :ok, location: @you_tube_video }
      else
        format.html { render :edit }
        format.json { render json: @you_tube_video.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /you_tube/videos/1
  # DELETE /you_tube/videos/1.json
  def destroy
    @you_tube_video.destroy
    respond_to do |format|
      format.html { redirect_to you_tube_videos_url, notice: 'Video was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_you_tube_video
      @you_tube_video = YouTube::Video.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def you_tube_video_params
      params[:you_tube_video]
    end
end
