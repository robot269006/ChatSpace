$(function() {

  function buildHTML(datareceiver){
    var bodyHtml = $('<li class="individualmessage__body">').append(datareceiver.body);
    return bodyHtml;
  };

  $('.write').on('submit', function(e){
    e.preventDefault();
    var textField = $('.write__text');
    var message = textField.val();
    var postUrl = location.href;
    $.ajax({
      type: 'POST',
      url: postUrl + '.json',
      data: { message: { body: message } },
      dataType: 'json'
    })
    .done(function(data){
      var htmlChunk = buildHTML(data);
      console.log(htmlChunk)
    })
    .fail(function(){
      alert('error');
    });
  });
});
