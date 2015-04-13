require 'dotenv/tasks'

namespace :search do
  desc 'Rebuild the search index'
  task rebuild: %i(dotenv environment) do
    PgSearch::Multisearch.rebuild(YouTube::Video)
    PgSearch::Multisearch.rebuild(YouTube::Playlist)
    PgSearch::Multisearch.rebuild(Transcript)
    PgSearch::Multisearch.rebuild(Interviewee)
  end
end
