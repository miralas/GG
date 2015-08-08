# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->
  $('#calendar').fullCalendar(
    lang: 'ru'

    eventSources: [
      url: '/events'
      color: '#bfb'
      textColor: '#555'
      ignoreTimezone: false
    ]

    eventClick: (event) ->
      window.open event.url, '_self' if event.url

  	dayClick: (date, allDay, jsEvent, view) ->
      window.open '/events/new?date=' + date, '_self'
  )