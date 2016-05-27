# frozen_string_literal: true
class AddSearchingHelpers < ActiveRecord::Migration
  def change
    enable_extension 'pg_trgm'
    enable_extension 'fuzzystrmatch'
  end
end
