$(document).ready ->
  $('.close').on "click", ->
    $('#showUser').fadeOut()

  $('form#new_user').on "ajax:success", (data, status, xhr) ->
    $('#listContainer').load('userlist/')

  $('#listContainer').on 'click', 'span.showUser', ->
    userid = $(this).attr('userid')
    $('#userDiv').load('users/' + userid, -> $('#showUser').show() )

  $('#listContainer').on 'ajax:success', '.delete_user', ->
    $(this).closest('tr').fadeOut()
