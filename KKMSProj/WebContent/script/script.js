/**
 * 
 */

var didScroll;
var lastScrollTop = 0;
var delta = 5;
var headerHeight = $("header").outerHeight();
var headerTabHeight = 110;
var WindowInHeight = $(window).innerHeight();
var scrollTop = $(window).scrollTop();
		
		
$(function() {
	// header
	if ($("header").length != 0) {
		$("header nav .menu").on("mouseenter", function() {
			$(".util").css("z-index", 9);
			gsap.to($("header "), 0.4, { height: "auto", ease: Power3.easeOut });
		}).on("mouseleave", function() {
			$(".util").css("z-index", "");
			gsap.to($("header "), 0.4, { height: 100, ease: Power3.easeOut });
		});


		$(window).on("scroll", function() { // scroll
			// header
			didScroll = true;
		}).scroll();

		setInterval(function() {
			if (didScroll) {
				hasScrolled();
				didScroll = false;
			}
		}, 50);
	}
	
	
	
	

});




$(window).on("load", function() {
	if ($("header").length != 0) {
		// gnb width
		var menuWid = $("header nav .one-dep").width();
		$("header nav .one-dep").each(function(e) {
			$("header nav .menu").width(menuWid * (e + 1));
		});
	}

	if ($("#wrap .sub-body").length != 0) {
		$("#wrap .sub-body").css("min-height", "100vh");
	}
});


// header scroll
function hasScrolled() {
	var st = $(this).scrollTop();

	if (Math.abs(lastScrollTop - st) <= delta)
		return;

	if (st > lastScrollTop && st > 100) {
		// scrollDown
		$("header").addClass("scroll_up");
		gsap.to($("header"), 0.4, { top: -$("header").height(), ease: Power3.easeOut });
	} else {
		if (st + $(window).height() < $(document).height()) {
			// scrollUp
			gsap.to($("header"), 0.4, { top: 0, ease: Power3.easeOut });

			if (st < 100) {
					$("header").removeClass("scroll_up");
			} else {
					$("header").addClass("scroll_up");
			}
		}
	}
	lastScrollTop = st;
}
/**
 * 
 */