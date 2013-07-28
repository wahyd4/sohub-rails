require 'google_calendar'

module GoogleCalendarService

  def init
    cal = Google::Calendar.new username: ENV['CAL_EMAIL'],
                               password: 'myaabhvqxotmporz',
                               app_name: 'sohub'
    cal
  end

  def calendar_list
    begin
      init.events
    rescue => errors
      Rails.logger.info "error=============="
    end
  end

end
