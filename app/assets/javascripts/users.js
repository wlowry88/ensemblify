$(function(){

	$(".intelligent_matches").hide();

	$(".wrapper").on("click", ".intelligent_musician_toggle", function(e){
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

	$(".all_matches").on("click", ".search_button", function(e){
		e.preventDefault();
		$(".instrument_field").parent().show();
		var instrument = $("#user_instrument_id").val();
		var available = $("#user_available").val();
		var interests = $("#user_instrumentation_ids").val();
		var level = $("#user_level").val();
		if(instrument.length > 0){
			$.each($(".instrument_field"), function(i, value){
				if($(value).text() !== instrument){
					$(value).parent().hide();
				}
			});
		}
		if(available.length > 0){
			$.each($(".available_field"), function(i, value){
				if($(value).text() !== available){
					$(value).parent().hide();
				}
			});
		}
		if(interests.length > 0){
			$.each($(".interests_field"), function(i, value){
				if($(value).text().indexOf(interests)===-1){
					$(value).parent().hide();
				}
			});
		}
		if(level.length > 0){
			$.each($(".level_field"), function(i, value){
				if($(value).text() !== level){
					$(value).parent().hide();
				}
			});
		}
	});

	$(".wrapper").on("click", ".clear_fields", function(e){
		e.preventDefault();
		$("#user_instrument_id").val("");
		$("#user_available").val("");
		$("#user_instrumentation_ids").val("");
		$("#user_level").val("");
	});

	$(".update-user-right").on("click", "#settings_edit_button", function(e){
		if(/^\d{5}(-\d{4})?$/.test($("#user_zipcode").val())){
		} else {
			e.preventDefault();
			alert("Please enter a valid zipcode! It should be in the form 12345 or 12345-1234")
		}
	});
	$(".email_form").hide();
	$(".email_area").on("click", ".email_form_button", function(e){
		e.preventDefault();
		$(".email_form").slideToggle();
	});

});