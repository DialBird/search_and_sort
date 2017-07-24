# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ ->
  changeEmployeeStatus = ->
    current_val = $('#search_user_is_employee').val()
    if current_val == 'employee'
      $('#search_user_corporation_name').prop('disabled', false)
    else
      $('#search_user_corporation_name').prop('disabled', true)

  $('#search_user_is_employee').on 'change', ->
    changeEmployeeStatus()

  changeEmployeeStatus()
