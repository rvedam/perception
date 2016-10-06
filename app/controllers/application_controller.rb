class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def set_default_vars
    @version_info = '0.1'
  end

end