# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


ready = ->
  max = 140
  $(".chirp-textarea").bind "input propertychange", (e) ->
    $("#character-left").text max - $(this).val().length
    return  if e.which < 0x20
    if @value.length is max
      e.preventDefault()
    else if @value.length > max
      $("#character-left").text max - $(this).val().length + 1
      @value = @value.substring(0, max)

$(document).ready(ready)
$(document).on('page:load', ready)
