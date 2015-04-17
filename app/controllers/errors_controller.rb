class ErrorsController < ApplicationController
  def intercept_404
    NotFound.create(url: request.url)

    not_found
  end
end
