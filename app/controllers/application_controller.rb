# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  # Be sure to include AuthenticationSystem in Application Controller instead
  include YogoAuthz::AuthenticatedSystem
  include YogoAuthz::AuthorizationSystem
  helper :all # include all helpers, all the time

  before_filter :mailer_set_url_options

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '024ae7a83bcf2695ed567609dd163991'
  
  # def admin_required
  #   (login_required && current_user.has_group?("sysadmin")) || access_denied
  # end
  
  private 
  def mailer_set_url_options
    ActionMailer::Base.default_url_options[:host] = request.host_with_port
  end
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password, :ldap_password
end
