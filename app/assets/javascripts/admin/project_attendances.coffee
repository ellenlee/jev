# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
	status_options = $('.status').html()
	if $("#attendance_attend").prop('checked') 
	  console.log(status_options)
