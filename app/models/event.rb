class Event < ActiveRecord::Base
  def as_json(options = {})
    {
      id: id,
      title: title,
      description: text || '',
      start: starts_at.iso8601,
      end: ends_at.iso8601,
      allDay: all_day,
      recurring: false,
      url: Rails.application.routes.url_helpers.edit_event_path(self)
    }
  end
end
