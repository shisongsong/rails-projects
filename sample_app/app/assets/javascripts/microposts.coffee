# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
@leftletters = (a) ->
  x = a.value.length
  document.getElementById("leftwords").innerHTML =140-x
  5
