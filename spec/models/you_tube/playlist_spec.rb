RSpec.describe YouTube::Playlist, type: :model do
  describe 'validations' do
    it { should have_many :videos }

    context 'description' do
      it { should validate_length_of(:description).is_at_least(1) }
      it { should validate_length_of(:description).is_at_most(5000) }
      it { should validate_presence_of :description }
      it { should_not allow_value("<angle\nbrackets>").for(:description) }
    end

    context 'title' do
      it { should validate_length_of(:title).is_at_least(1) }
      it { should validate_length_of(:title).is_at_most(100) }
      it { should_not allow_value('<anglebrackets>').for(:title) }
      it { should validate_presence_of :title }
    end

    it { should validate_presence_of :etag }
    it { should validate_presence_of :remote_playlist_id }

    context 'uniqueness' do
      subject { YouTube::Playlist.new(remote_playlist_id: 'xxx', etag: 'xxx', title: 'xxx', description: 'xxx') }

      it { should validate_uniqueness_of :etag }
      it { should validate_uniqueness_of :title }
      it { should validate_uniqueness_of :remote_playlist_id }
    end
  end
end
