$(function() {
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
      alert('success');
    })
    .fail(function(){
      alert('error');
    });
  });
});
