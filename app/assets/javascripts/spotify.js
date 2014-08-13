$(function(){

	function getSpotifyJson(title, composer) {

    var $title_url = encodeURIComponent(title),
        $composer_url = encodeURIComponent(composer),
        $uri;

      $.ajax({
        url: "https://api.spotify.com/v1/search?q=" + $title_url + "%20" + $composer_url + "&type=track&limit=1",
        success: function (data) {
          window.open(data.tracks.items[0].preview_url);
        }
      });    

  }

  $(".all_pieces_div").on("hover", ".piece_row", function(){
    $(this).find("#spotify_button").toggle();
  });

  $(".piece_row").on("click", "#spotify_button", function(e){
    e.preventDefault();

    var $name = $("#piece_name").next().find("span");
    var $composer = $("#piece_composer").next().find("span");

    getSpotifyJson($name, $composer);
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