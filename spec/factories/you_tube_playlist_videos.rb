FactoryGirl.define do
  factory :you_tube_playlist_video, class: 'YouTube::PlaylistVideo' do
    playlist_id 'MyString'
    video_id 'MyString'
  end
end

# == Schema Information
#
# Table name: you_tube_playlist_videos
#
#  id          :integer          not null, primary key
#  playlist_id :integer          not null
#  video_id    :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
