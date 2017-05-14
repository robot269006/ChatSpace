$(function() {
  $('#search_window').on("keyup", function(e){
    e.preventDefault();
    keyword = $('#search_window').val();
    console.log(keyword);
  });
});
