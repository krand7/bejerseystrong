$(document).ready ->
  $("[data-object~='navbar-collapse']").click (e) ->
    $('#container-left').toggleClass 'active-nav'
    $('#container-right').toggleClass 'active-nav'