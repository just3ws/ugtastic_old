class ErrorsController < ApplicationController
  def intercept_404
    Rails.logger.error("INTERCEPTED_404=#{request.url}")

    not_found
  end
end
