$(function(){

	function getSpotifyPreview(instrumentation, composer, id) {

    var $title_url = encodeURIComponent(instrumentation),
        $composer_url = encodeURIComponent(composer),
        $uri;

      $.ajax({
        url: "https://api.spotify.com/v1/search?q=" + $title_url + "%20" + $composer_url + "&type=track&limit=1",
        success: function (data) {
        $("#"+id).append('<iframe class="popup_iframe" src= "'+data.tracks.items[0].preview_url+'"></iframe>');
        $.ajax({
          url: "/pieces",
          type: "POST",
          dataType: "json",
          data: (id + "||" + data.tracks.items[0].uri),
          success: function (data){
          }
        });    
      }
    });
  }
  

  $(".all_pieces_div").on("mouseover", ".piece_row", function(){
    $(this).find("#spotify_button").show();
  });
  $(".all_pieces_div").on("mouseleave", ".piece_row", function(){
    $(this).find("#spotify_button").hide();
  });

  $(".piece_row").on("click", "#spotify_button", function(e){
    e.preventDefault();

    var $instrumentation = $(this).parent().parent().find(".interests_field").text()
    var $composer = $(this).parent().parent().find(".composer_name_field").text()
    var $id = $(this).parent().parent().attr("id")

    if($(this).text()=="Listen") {
      getSpotifyPreview($instrumentation, $composer, $id);
      $(this).text("Close");
    } else if ($(this).text()=="Close") {
      $("iframe").remove();
      $(this).text("Listen")
    }
  });


    // function ajax1() {
    //   return $.ajax({
    //     url: "https://api.spotify.com/v1/search?q=" + $title_url + "%20" + $composer_url + "&type=track&limit=1",
    //     success: function (data) {
    //       $uri = data.tracks.items[0].uri;
    //     }
    //   });
    // }
    // $.when(ajax1()).done(function () {
    //     $("body").append("<iframe src=\"https://embed.spotify.com/?uri=\"+$uri+\" width=\"300\" height=\"380\" frameborder=\"0\" allowtransparency=\"true\"></iframe>");
    // });



});