$(document).ready(function() {
  //function that generates div that contains user name
  function buildHTML(user) {
    var html = '<div>' + user.name + '</div>'
    return html;
  }
  //preset all the variables, to prevent "undefined" values
  var preSet = null;
  var preInput = "";
  var input = "";
  var result = "";
  //XSS -> prevent malicious parameters being sent from the input
  sanitize = function(target){
    target.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
    return target;
  }
  //set search function, that is later used together with setTimeout method
  ajaxSearch = function () {
    $.ajax({
      // send request to /users/search(controller), with keyword+input parameters, with response in json format
      url: '/users/search',
      type: "GET",
      data: ("keyword=" + input),
      dataType: 'json',
      contentType: 'application/json'
    })
    .done(function(data) {
      data.forEach(function(data) {
        result += buildHTML(data);
      });
      $('#user-search-result').append(result);
    })
    .fail(function() {
      alert('error');
    });
  };
  //retrieve input from the search field
  //run ajaxSearch in the right timing
  $('#search_window').on('keyup', function() {
    input = $.trim($(this).val());
    sanitize(input);
    //receive keyup changes everytime, but only runs ajaxSearch every time input is changed, and input change is checked every 500ms
    if(preInput !== input){
      clearTimeout(preSet);
      preSet = setTimeout(ajaxSearch, 500);
    }
    preInput = input;
  });
});
