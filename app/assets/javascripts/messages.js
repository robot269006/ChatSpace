$(function() {

  //append name, date, body to ul and li classes in _messages.haml partial files
  function buildHTML(datareceiver){
    var list = $('<ul class="individualmessage">');
    //date cleaning
    var tempdate  = datareceiver.created_at.replace('T', ' ').replace(/-/g, '/').replace(/.\d\d\d.$/, '');
    var name  = list.append($('<li class="individualmessage__name">' + datareceiver.name + '</li>'));
    var date  = list.append($('<li class="individualmessage__date">' + tempdate + '</li>'));
    var body  = list.append($('<li class="individualmessage__body">' + datareceiver.body + '</li>'));
    if (datareceiver.image === null) {
    } else { var image = list.append($('<li class="individualmessage__image">' + "<img src=" + datareceiver.image.url + ">" + '</li>'));
    }
    return list;
  };
  //XSS -> prevent malicious parameters being sent
  function sanitize(target){
    target.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;').replace(/"/g, '&quot;').replace(/'/g, '&#39;');
    return target;
  };

  //retrieve typed in messagea
  $('.group__bottom__form').on('submit', function(e){
    e.preventDefault();
    sanitize(($('.group__bottom__form__text')).val());
    var formData = new FormData($('form#new_message').get()[0]); //all form data to be posted to requested URL
    $.ajax({
      type: 'POST',
      url: location.href,
      data: formData,
      processData: false, //object not to be transcripted to query
      contentType: false,
      dataType: 'json'
    })
    //append resulting li elements to .group__middle class
    .done(function(data){
      var htmlChunk = buildHTML(data);
      $('.group__middle').append(htmlChunk);
      $('.group__bottom__form__text').val('');
    })
    .fail(function(){
      alert('error');
    });
  });

  //activate image file selection
  $('.fa fa-picture-o').on('click', function(){
    $('#message-image').click();
  });

  // variable to set interval
  var timer;
  //updater
  function autoUpdate(){
    $.ajax({
    })
    .done(function(data){
      var url = $(".group__middle").data('group-id')
      $('.group__middle').load("/groups/" + url + "/messages" + " .individualmessage");
      console.log("testing");
    })
    .fail(function(){
      alert('auto-upload failure');
      clearTimeout(timer);
    });
  };

  //autoupdate function when the page is initially loaded
  $(document).ready(function(){
    //run update the first time to kick it off
    autoUpdate();
    timer = setInterval(function(){ autoUpdate(); }, 5000);
  });


});

