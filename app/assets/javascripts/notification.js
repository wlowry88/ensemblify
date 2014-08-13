$(function(){

	$(".pull-right").on("click", "#notification", function(){
		$("#notifications_triangle").slideToggle(400);
		$("#notifications_box").slideToggle();
	})

});