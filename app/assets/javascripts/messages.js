$(function() {

  function buildHTML(datareceiver){
    var list = $('<ul class="individualmessage">');
    var name = list.append($('<li class="individualmessage__name">' + datareceiver.name + '<li>'));
    var date = list.append($('<li class="individualmessage__date">' + datareceiver.created_at + '<li>'));
    var body = list.append($('<li class="individualmessage__body">' + datareceiver.body + '<li>'));
    return list;
  };

  $('.write').on('submit', function(e){
    e.preventDefault();
    var textField = $('.write__text');
    var message = textField.val().replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
    var postUrl = location.href;
    $.ajax({
      type: 'POST',
      url: postUrl + '.json',
      data: { message: { body: message } },
      dataType: 'json'
    })
    .done(function(data){
      var htmlChunk = buildHTML(data);
      $('.group__middle').append(htmlChunk);
      textField.val('');
    })
    .fail(function(){
      alert('error');
    });
  });
});

