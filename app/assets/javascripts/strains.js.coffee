# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$('#search').on 'keyup', ->
  input = $('input[id=search]').val()
  $.ajax
    url: "http://localhost:3000/search?s=#{input}",
    dataType: "json",
    success: ( results ) ->
      $('#results').text("")
      $.each results.strains, ->
        $('#results').append("<div class='result'><a href='/strains/#{this.id}'>#{this.name}</a></div><hr>")