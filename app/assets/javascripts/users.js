$(function(){

	$(".all_matches").hide();

	$(".wrapper").on("click", ".intelligent_all_toggle", function(e){
		e.preventDefault();
		$(".intelligent_matches").toggle();
		$(".all_matches").toggle();
		$(this).text(function(){
			if($(this).text() == "Show Intelligent Matches") {
				return "Show All Musicians"
			} else {
				return "Show Intelligent Matches"
			}
		});
	});

});