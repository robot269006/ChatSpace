$(window).on('load', function() {
  var
  preSet = null,
  preInput = '',
  input = '',
  ajaxSearch = function () {
    $.ajax({
      // this hands over keyqord=xxx query data in json format to users/search path
      url: '/users/search',
      type: "GET",
      data: ("keyword=" + input),
      dataType: 'json'
    })
    .done(function(data) {
      data.forEach(function(data) {
        console.log(data.name);
      });
    })
    .fail(function() {
      alert('error');
    });
  };
  $('#search_window').on('keyup', function() {
    input = $('#search_window').val();
    if(preInput !== input){
      clearTimeout(preSet);
      preSet = setTimeout(ajaxSearch, 500);
    }
    preInput = input;
  });
});
