jQuery(document).ready(function($) {

	/* ########## */
	/*  CAROUSEL  */
	/* ########## */

	// Setting variables
	$home_carousel = $('#myCarousel');

	// Setting up homepage carousel
	$home_carousel.carousel({
		interval: false 
	})

	// animate first caption on website load
	$home_carousel.find('.active .caption p').animate({opacity: 1}, 600);
	// animate captions on slide (turn on/off)
	$home_carousel.bind('slid', function() {
		$(this).find('.active .caption p').animate({opacity: 1}, 600);
	}).bind('slide', function() {
		$(this).find('.active .caption p').animate({opacity: 0}, 300);
	});

});

// Custom sorting plugin
(function($) {
  $.fn.sorted = function(customOptions) {
    var options = {
      reversed: false,
      by: function(a) { return a.text(); }
    };
    $.extend(options, customOptions);
    $data = $(this);
    arr = $data.get();
    arr.sort(function(a, b) {
      var valA = options.by($(a));
      var valB = options.by($(b));
      if (options.reversed) {
        return (valA < valB) ? 1 : (valA > valB) ? -1 : 0;				
      } else {		
        return (valA < valB) ? -1 : (valA > valB) ? 1 : 0;	
      }
    });
    return $(arr);
  };
})(jQuery);

// DOMContentLoaded
$(function() {

  // bind radiobuttons in the form
  var $filterType = $('#portfolio-nav');

  // get the first collection
  var $applications = $('#applications');

  // clone applications to get a second collection
  var $data = $applications.clone();


  // attempt to call Quicksand on every form change
  $filterType.find('li').on('click', function(e) {
    e.preventDefault();

    // all/type filtering
    if ( $(this).data('type') == 'all') {
      var $filteredData = $data.find('li');
    } else {
      var $filteredData = $data.find('li[data-type=' + $(this).data('type') + ']');
    }

    // finally, call quicksand
    $applications.quicksand($filteredData, {
      duration: 800,
      easing: 'easeInOutQuad'
    });

  });

});

