require 'google_calendar_service'

class CalendarController < ApplicationController

  include GoogleCalendarService

  caches_action :index, expires_in: 1.hour

  def index
    @list = calendar_list
    @list.each do |calendar|
      calendar.calendar = nil
    end
    render json: @list
  end

end
