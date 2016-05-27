# frozen_string_literal: true
class SitemapsController < ApplicationController
  layout nil

  def index
    @interviews = YouTube::Video.published.order(id: 'asc')

    respond_to do |format|
      format.xml
    end
  end
end
