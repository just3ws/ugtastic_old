class InterviewsController < ApplicationController
  def index
    query = params[:q]

    @you_tube_videos = if query.present?
                         found_ids = PgSearch.
                           multisearch(query).
                           where(searchable_type: 'YouTube::Video').
                           pluck(:searchable_id).
                           uniq.
                           sort

                         YouTube::Video.
                           includes(:conference, :interviewees).
                           published.
                           where('you_tube_videos.id in (?)', found_ids).
                           order(id: 'asc')



                       else
                         YouTube::Video.
                           includes(:conference, :interviewees).
                           published.
                           order(id: 'asc')
                       end
  end

  def show
    @you_tube_video = YouTube::Video.friendly.find(params[:id])
  end
end
