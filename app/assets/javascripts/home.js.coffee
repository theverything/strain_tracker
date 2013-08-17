# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(->
  $(".facebook-image").on "mouseup", ->
    $this = $(@)
    $this.attr("src",
      "/assets/FacebookLogin.png")

  $(".facebook-image").on "mousedown", ->
    $this = $(@)
    $this.attr("src",
      "/assets/FacebookLoginActive.png")

)