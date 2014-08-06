	$(".all_matches").hide();

	$(".wrapper").on("click", ".intelligent_ensemble_toggle", function(e){
		e.preventDefault();
		$(".intelligent_matches").toggle();
		$(".all_matches").toggle();
		$(this).text(function(){
			if($(this).text() == "Show Intelligent Matches") {
				return "Show All Ensembles"
			} else {
				return "Show Intelligent Matches"
			}
		});
	});	