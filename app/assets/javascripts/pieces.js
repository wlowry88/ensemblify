$(function(){
	function sleep(milliseconds) {
	  var start = new Date().getTime();
	  for (var i = 0; i < 1e7; i++) {
	    if ((new Date().getTime() - start) > milliseconds){
	      break;
	    }
	  }
	}
	$(".add_piece_button").hide();
	$(".add_piece_to_group_form").hide();

	$(".all_pieces_div").on("click", "input.search_button", function(e){
		e.preventDefault();

		$(".piece_name_field").parent().show();

		var $name = $("#piece_name").next().find("span")
		var $composer = $("#piece_composer").next().find("span")
		var $ensemble_type = $("#piece_instrumentation").next().find("span")

		if($name.text()!=("Select an Option")){
			$.each($(".piece_name_field"), function(i, value){
				if($(value).text() != $name.text()){
					$(value).parent().hide();
				}
			});
		}
		if($composer.text()!=("Select an Option")){
			$.each($(".composer_name_field"), function(i, value){
				if($(value).text() != $composer.text()){
					$(value).parent().hide();
				}
			});
		}
		if($ensemble_type.text()!=("Select an Option")){
			$.each($(".interests_field"), function(i, value){
				if($(value).text() !== $ensemble_type.text()){
					$(value).parent().hide();
				}
			});
		}

	});

	$(".wrapper").on("click", ".clear_fields", function(e){
		e.preventDefault();
		$("#piece_name").next().find("span").text("Select an Option")
		$("#piece_composer").next().find("span").text("Select an Option")
		$("#piece_instrumentation").next().find("span").text("Select an Option")
	});

	$(".all_pieces_div").on("hover", ".piece_row", function(){
		$(this).find(".add_piece_button").toggle();
	});

	$(".all_pieces_div").on("click", ".add_piece_button", function(e){
		e.preventDefault();

	})

	$(".piece_row").on("click", ".add_piece_button", function(e){
		e.preventDefault();
		$(this).parent().find("div").slideToggle();
	});


	$(".piece_row").on("click", ".add_piece_btn", function(e){
		e.preventDefault();

		var $form = $(this).closest("form");
		var $div = $(this).parent().parent();
		var $row = $div.parent().parent();

		$.ajax({
			url: "/group_pieces",
			type: "post",
			dataType: "json",
			data: $form.serialize(),
			success: function(data){
				$form.css({"color":"green","text-decoration":"line-through"});
				$form.text("successfully added to group");
				$form.fadeOut(1000, function(){
					$form.remove();

					if ($div.find("form").length==0){
						$div.remove();
						$row.css({"color":"green","text-decoration":"line-through"});
						$row.fadeOut(1000, function(){
							$row.remove();
						})
					}
				});
			}
		});



	});




});