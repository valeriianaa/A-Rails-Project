# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
	$('#img_nuevo').hide()
	$('#bt_cambiar_imagen').click ->
		$('#img_existente').hide()
		$('#img_nuevo').show()