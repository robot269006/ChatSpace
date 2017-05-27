$(function() {

  //append name, date, body to ul and li classes in _messages.haml partial files
  function buildHTML(datareceiver){
    var list = $('<ul class="individualmessage">');
    var name = list.append($('<li class="individualmessage__name">' + datareceiver.name + '<li>'));
    var date = list.append($('<li class="individualmessage__date">' + datareceiver.created_at + '<li>'));
    var body = list.append($('<li class="individualmessage__body">' + datareceiver.body + '<li>'));
    return list;
  };
  //XSS -> prevent malicious parameters being sent
  sanitize = function(target){
    target.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
    return target;
  }

  //retrieve typed in message
  $('.group__bottom__form').on('submit', function(e){
    e.preventDefault();
    var textField = $('.group__bottom__form__text');
    var message = textField.val();
    sanitize(message);
    var postUrl = location.href;
    var formData = new FormData($('form#new_message').get()[0]); //all form data to be posted to requested URL
    $.ajax({
      type: 'POST',
      url: postUrl,
      data: formData,
      processData: false, //object not to be transcripted to query
      contentType: false,
      dataType: 'json'
    })
    //append resulting li elements to .group__middle class
    .done(function(data){
      var htmlChunk = buildHTML(data);
      $('.group__middle').append(htmlChunk);
      textField.val('');
    })
    .fail(function(){
      alert('error');
    });
  });

  //activate image file selection
  $('.fa fa-picture-o').on('click', function(){
    $('#message-image').click();
  });
});

