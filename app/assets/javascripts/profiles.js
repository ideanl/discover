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
            var movies = "<div>" + data['movie'] + "<button class='close' type='button' aria-hidden='true'>&times;</button></div>"
            console.log(movies);
            $('#moviesModal #movies-panel-body').append(movies);
          }
        }
      }
    });
  });
});
