# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$('#participation_group_id').parent().hide()
	groups = $('#participation_group_id').html()
	$('#participation_project_id').change ->
		project = $('#participation_project_id :selected').text()
		selected_project = project.replace(/([ #;&,.+*~\':"!^$[\]()=>|\/@])/g, '\\$1')
		options = $(groups).filter("optgroup[label='#{selected_project}']").html()
		if options
			$('#participation_group_id').html(options)
			$('#participation_group_id').parent().show()
		else
			$('#participation_group_id').empty()
			$('#participation_group_id').parent().hide()
