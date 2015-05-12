class ErrorsController < ApplicationController
  def intercept_404
    not_found
  end
end
