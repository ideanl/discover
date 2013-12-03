$(document).ready(function(e) {
  $('#movieform').on('click', '#movieinputsubmit', function(e) {
    var form_array = $('form#movieform').serializeArray()
    var params = $.param(form_array)
    $.ajax({
      type: 'post',
      url: "/profiles/save_profile_interests?" + params,
      success: function(data) {
        for (key in data) {
          if (data !== "") {
            var movies = "<div>" + data['movie'] + "<button class='close' type='button' aria-hidden='true'>&times;</button></div>";
            if ($('#moviesModal #movies-panel-body').length == 0)  { 
              var panel = "<div class='panel panel-default' id='movies-panel'><div class='panel-body' id='movies-panel-body'></div></div>";
              $('#moviesModal #panel-container').html(panel)
              $('#moviesModal #movies-panel-body').html(movies);
            }
            else {
              $('#moviesModal #movies-panel-body').append(movies);
            }
          }
        }
      }
    });
  });
});
