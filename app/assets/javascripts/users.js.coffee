$(document).ready ->
  $('.close').click ->
    $('#showUser').fadeOut()

  $('form#new_user').on "ajax:success", (data, status, xhr) ->
    $('#listContainer').load('userlist/', -> bindListBehavior())

  bindListBehavior = ->
    $('span.showUser').click ->
      userid = $(this).attr('userid')
      $('#userDiv').load('users/' + userid, -> $('#showUser').show() )

    $('.delete_user').bind 'ajax:success', ->
      $(this).closest('tr').fadeOut()

  # only major change in coffeescript translation: bindListBehavior must be called after it is defined
  bindListBehavior()
