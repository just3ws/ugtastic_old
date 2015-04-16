require 'uuidtools'

class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user
  helper_method :user_signed_in?
  helper_method :correct_user?

  before_action :log_metrics
  before_action :get_conferences

  rescue_from ActionController::RoutingError, with: :render_404

  def not_found(exception = nil)
    logger.info "Rendering 404: #{exception.message}" if exception

    render file: "#{Rails.root}/public/404.html", status: 404, layout: false
  end

  private

  def log_metrics
    xff = request.headers['X-Forwarded-For'] || ''
    requestor_ip = xff.split(/, ?/)[0] || request.ip

    filters = Rails.application.config.filter_parameters
    f = ActionDispatch::Http::ParameterFilter.new(filters)

    Metric.create(
      session_id:           session.nil? && session[:session_id].nil? ? nil : session[:session_id],
      request_controller:   request.params[:controller],
      request_action:       request.params[:action],
      request_ip:           request.ip,
      request_xff:          xff,
      request_requestor_ip: requestor_ip,
      request_referrer:     request.referrer,
      request_url:          request.url,
      request_method:       request.method.to_s,
      request_params:       MultiJson.dump(f.filter(request.params)),
      user_id:              current_user.nil? ? nil : current_user.id,
      request_user_agent:   request.env['HTTP_USER_AGENT']
    )

  rescue => ex
    Rails.logger.error("#{ex.message}\n  #{ex.backtrace.join("\n  ")}")
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue StandardError => e
    Rails.logger.ap(e, :debug)
    nil
  end

  def user_signed_in?
    return true if current_user
  end

  def correct_user?
    @user = User.find(params[:id])
    redirect_to root_url, alert: 'Access denied.' unless current_user == @user
  end

  def authenticate_user!
    redirect_to root_url, alert: 'You need to sign in for access to this page.' unless current_user
  end

  def get_conferences
    @nav_conferences = Conference.published
  end
end
