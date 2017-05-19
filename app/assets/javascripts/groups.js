$(window).on('load', function() {
  function buildHTML(user) {
    var html = '<div>' + user.name + '</div>'
    return html;
  }
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
      dataType: 'json',
      contentType: 'application/json'
    })
    .done(function(data) {
      var result;
      data.forEach(function(data) {
        result += buildHTML(data);
      });
      $('#user-search-result').append(result);
    })
    .fail(function() {
      alert('error');
    });
  };
  $('#search_window').on('keyup', function() {
    input = $.trim($(this).val());
    if(preInput !== input){
      clearTimeout(preSet);
      preSet = setTimeout(ajaxSearch, 500);
    }
    preInput = input;
  });
});
