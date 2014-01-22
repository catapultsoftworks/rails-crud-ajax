$(document).ready(
  function() {
  
   $('.close').click(
      function() {
         $('#showUser').fadeOut();
      }
   );
  $('form#new_user')
    .bind("ajax:success", function(data, status, xhr) {
       $('#listContainer').load('userlist/', function() { bindListBehavior(); });
    });
   bindListBehavior();

   function bindListBehavior() {
   $('span.showUser').click(
       function() {
           var userid = $(this).attr('userid');
           $('#userDiv').load('users/' + userid, function() { $('#showUser').show(); } );
       }
   );
   $('.delete_user').bind('ajax:success', function() {
        $(this).closest('tr').fadeOut();
   });
  }
}
);
