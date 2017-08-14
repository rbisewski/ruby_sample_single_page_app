class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  #
  # Send the main server to index.html.erb
  #
  def index
  end
end
