RailsAdmin.config do |config|
  config.audit_with :paper_trail, 'User', 'PaperTrail::Version' # PaperTrail >= 3.0.0

  config.actions do
    dashboard
    index
    new
    export
    bulk_delete
    show
    edit
    delete
    show_in_app

    history_index
    history_show
  end

  config.authorize_with do
    authenticate_or_request_with_http_basic('Site Message') do |username, password|
      username == ENV['ADMIN_USER'] && password == ENV['ADMIN_PWD']
    end
  end
end
