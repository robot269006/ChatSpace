$(function() {
  $('.write').on('submit', function(e){
    e.preventDefault();
    message = $('.write__text').val();
    console.log(message);
  });
});
