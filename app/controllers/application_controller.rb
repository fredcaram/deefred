class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_message, :set_rsvp
  def set_message
    @message = flash[:message]
  end

  def set_rsvp
    @rsvp = Rsvp.new
  end

end
