# frozen_string_literal: true
class InterviewsController < ApplicationController
  def index
    @interviews = if params[:q].present?

                    @query = params[:q].strip
                    @header_title = "Interview Search: \"#{@query}\""

                    found_ids = PgSearch
                                .multisearch(@query)
                                .where(searchable_type: 'YouTube::Video')
                                .uniq
                                .pluck(:searchable_id)
                                .sort

                    YouTube::Video
                      .includes(:conference)
                      .published
                      .where('you_tube_videos.id in (?)', found_ids)
                      .order(id: 'asc')

                  else
                    YouTube::Video
                      .includes(:conference)
                      .published.order('priority desc, id asc')
                  end
  end

  def show
    @interview = YouTube::Video.friendly.find(params[:id])
  end
end
