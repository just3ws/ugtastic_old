# TODO: Status for display on the site. State for sync. Probably need a better name for these.
module YouTube
  class Video < ActiveRecord::Base
    enum status: %i(hide show)

    has_paper_trail
    acts_as_taggable

    include PgSearch
    multisearchable against: %i(context description name remote_video_id subtitle title), using: %i(tsearch trigram dmetaphone), ignoring: %i(accents), if: :published?

    belongs_to :conference, inverse_of: :interviews

    scope :published, -> { where(status: YouTube::Video.statuses[:show]) }

    validates :remote_video_id, presence: true, uniqueness: true

    validates :etag,
              presence: true,
              uniqueness: true

    validates :title,
              presence: true,
              length: { in: 1..100 },
              format: { without: /(<|>)/, message: "can't contain anglebrackets" }

    validates :description,
              presence: true,
              length: { in: 0..5000 },
              format: { without: /(<|>)/, multiline: true, message: "can't contain anglebrackets" },
              allow_blank: true

    has_many :playlist_videos
    has_many :playlists,
             through: :playlist_videos,
             class_name: 'YouTube::Playlist',
             inverse_of: :videos

    has_many :video_interviewees
    has_many :interviewees,
             through: :video_interviewees,
             inverse_of: :videos

    has_many :transcripts, inverse_of: :video

    extend FriendlyId
    friendly_id :slug_candidates, use: :slugged

    def published?
      self.class.statuses[status] == self.class.statuses[:show]
    end

    def slug_candidates
      if at_conference?
        [
          %i(conference_name conference_year interviewee_names),
          %i(conference_name conference_year interviewee_names subtitle)
        ]
      else
        [
          :interviewee_names,
          %i(interviewee_names subtitle),
          [:interviewee_names, :subtitle, 1],
          [:interviewee_names, :subtitle, 2],
          [:interviewee_names, :subtitle, 3],
          [:interviewee_names, :subtitle, 4],
        ]
      end
    end

    def name
      # HACK: to shut friendly_id up when it tries to access the name.
      nil
    end

    def at_conference?
      return false if conference_name.nil?
      return false if conference_name == 'Null'
      true
    end

    delegate :year, to: :conference, prefix: true, allow_nil: true

    delegate :name, to: :conference, prefix: true, allow_nil: true

    def interviewee_names
      interviewees.pluck(:name).to_sentence
    end

    def thumbnail(size = 'default')
      @thumbnail ||= {}
      size = size.to_s.downcase

      case size
      when 'default', 'medium', 'high', 'standard'
        @thumbnail[size] ||= OpenStruct.new(cache['snippet']['thumbnails'][size])
      else
        fail "Unknown thumbnail size \"#{size}\"."
      end

      @thumbnail[size]
    end

    rails_admin do
      configure :status do
        searchable false
      end

      list do
        sort_by :id

        field :id
        field :title
        field :interviewees
        field :context
        field :status
      end

      edit do
        field :title
        field :context
        field :subtitle

        field :description, :text

        field :interviewees
        field :conference
        field :transcripts

        field :status

        field :slug do
          read_only true
        end

        field :remote_video_id do
          read_only true
          pretty_value do # used in list view columns and show views, defaults to formatted_value for non-association fields
            <<-EOS
<iframe
  id="ytplayer"
  type="text/html"
  width="640"
  height="390"
  src="https://www.youtube.com/embed/#{value}?cc_load_policy=1&enablejsapi=1&modestbranding=1&playsinline=1&start=10&autohide=1&color=white&theme=light"
  frameborder="0"
  allowfullscreen></iframe>
            EOS
          end
        end
      end
    end
  end
end

# == Schema Information
#
# Table name: you_tube_videos
#
#  id              :integer          not null, primary key
#  remote_video_id :string           not null
#  cache           :json
#  etag            :string           not null
#  title           :string           not null
#  description     :text
#  state           :string           default("new")
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slug            :string
#  context         :string
#  subtitle        :string
#  status          :integer          default(0), not null
#  conference_id   :integer
#
