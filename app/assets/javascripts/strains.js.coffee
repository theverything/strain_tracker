# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $('#search').on 'keyup', ->
    input = $('input[id=search]').val()
    $.ajax
      url: "/search?s=#{input}",
      dataType: "json",
      success: ( results ) ->
        $('#results').text("")
        $.each results.strains, ->
          $('#results').append("<a href='/strains/#{this.id}'><div class='result'><span class='#{this.category.toLowerCase()}'>#{this.category.toUpperCase()}</span><span class='name'>#{this.name.toUpperCase()}</span><span class='rating'>#{this.rating}/10</span></div></a>")
