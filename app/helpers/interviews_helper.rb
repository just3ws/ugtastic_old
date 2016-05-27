# frozen_string_literal: true
module InterviewsHelper
  def title_for_interview(you_tube_video)
    if you_tube_video.at_conference?
      "Interview with #{you_tube_video.interviewee_names} @ #{you_tube_video.conference_name} #{you_tube_video.conference.city} #{you_tube_video.conference_year}"
    else
      "Interview with #{you_tube_video.interviewee_names}"
    end
  end
end
