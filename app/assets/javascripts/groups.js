$(function(){
	$(".all_ensemble_matches").hide();

	$(".wrapper").on("click", ".intelligent_ensemble_toggle", function(e){
		e.preventDefault();
		$(".intelligent_matches").toggle();
		$(".all_ensemble_matches").toggle();
		$(this).text(function(){
			if($(this).text() == "Show Intelligent Matches") {
				return "Show All Ensembles"
			} else {
				return "Show Intelligent Matches"
			}
		});
	});


	$(".all_ensemble_matches").on("click", ".search_button", function(e){
		e.preventDefault();
		$(".group_complete").parent().show();
		var instrumentation = $("#group_instrumentation_id").val();
		var instruments = $("#group_instruments").val();
		var complete = $("#group_complete").val();
		if(instrumentation.length > 0){
			$.each($(".group_instrumentation"), function(i, value){
				if($(value).text() !== instrumentation){
					$(value).parent().hide();
				}
			});
		}
		if(complete.length > 0){
			$.each($(".group_complete"), function(i, value){
				if($(value).text() !== complete){
					$(value).parent().hide();
				}
			});
		}
	});

	$(".wrapper").on("click", ".clear_fields", function(e){
		e.preventDefault();
		$("#group_instrumentation_id").val("");
		$("#group_instruments").val("");
		$("#group_complete").val("");
	});

});