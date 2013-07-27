require 'google_calendar'

module GoogleCalendarService

  def init
    Google::Calendar.new username: ::ENV['CAL_EMAIL'],
                         password: ::ENV['CAL_CREDENTIAL'],
                         app_name: 'sohub'

  end

  def calendar_list
    list = self.init.events.limit
    list
  end

end
