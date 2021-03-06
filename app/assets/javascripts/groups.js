$(function(){

	$(".intelligent_ensemble_matches").hide();
	$(".instrument_options_for_alternate_group").hide();

	$(".wrapper").on("click", ".intelligent_ensemble_toggle", function(e){
		e.preventDefault();
		$(".intelligent_matches").toggle();
		$(".all_ensemble_matches").toggle();
		$(this).text(function(){
			if($(this).text() == "Show All Ensembles") {
				return "Show Intelligent Matches"
			} else {
				return "Show All Ensembles"
			}
		});
	});

	$(".show_parts").hide();

	$(".group_parts").on("click", ".show_parts_button", function(e){
		e.preventDefault();
		$(".show_parts").slideToggle();
	})

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
		var ensembleMatches;
		function ajax1(){
			return $.ajax({
				url: 'search/get_instruments_for_group',
				type: 'POST',
				data: {instrument: $("#group_instruments").val()},
				success: function(data){
					ensembleMatches = data.join(",");
				}
			});
		}
		$.when(ajax1()).done(function(){
			if(instruments.length > 0){
				$.each($(".group_instrumentation"), function(i, value){
					if(ensembleMatches.indexOf($(value).text())===-1){
						$(value).parent().hide();
					}
				});
			}
		});
	});

	$(".wrapper").on("click", ".clear_fields", function(e){
		e.preventDefault();
		$(".chosen-container-single span").text("Select an Option");
		$("#group_instrumentation_id").val("");
		$("#group_instruments").val("");
		$("#group_complete").val("");
	});

	$("#alternate_instrumentation").on("change", function(){
		if ($(this).val() === "16"){
			$(".instrument_options_for_alternate_group").show();
		}
	})

	$(".row").on("hover", "li", function(){
		$(this).find(".delete_piece_x").toggle();
	});

	$(".row").on("click", ".delete_piece_x", function(e){
		e.preventDefault();
		$id = $(this).parent().attr("id")
		$row = $(this).parent()

		if (confirm("Delete "+$row.text()+"...for real??") == true) {
			$.ajax({
				url: "/group_pieces/"+$id,
				type: "delete",
				success: function (){
					
					$row.css({"color":"red","text-decoration":"line-through"});
					$row.text("successfully removed");
					$row.fadeOut(1500, function(){
						$row.remove();
					});
				}
			})
		}
	});



});