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

	// top btn
	if ($(".quick_div .top_btn").length != 0) {
		$(".quick_div .top_btn").on("click", function() {
			$("html, body").animate({ scrollTop: 0 }, 400);
			return false;
		});
	}

	// header
	if ($("header").length != 0) {
		$("header nav .menu").on("mouseenter", function() {
			$(".hUtil").css("z-index", 9);
			gsap.to($("header "), 0.4, { height: "auto", ease: Power3.easeOut });
		}).on("mouseleave", function() {
			$(".hUtil").css("z-index", 2);
			gsap.to($("header "), 0.4, { height: 100, ease: Power3.easeOut });
		});


		$(window).on("scroll", function() { // scroll
			// header
			didScroll = true;

			// top btn
			if ($(".quick_div .top_btn").length != 0) {

				if ($(window).scrollTop() > 100) {
					$(".quick_div .top_btn").fadeIn(300);
				} else  {
					$(".quick_div .top_btn").fadeOut(300);
				}

				if ($(window).scrollTop() >= $("footer").offset().top - WindowInHeight) {
					$(".quick_div").css({ "position": "absolute", "bottom": $("footer").outerHeight() + 40 });
				} else {
					$(".quick_div").css({ "position": "fixed", "bottom": 40 });

				}
			}
		}).scroll();

		setInterval(function() {
			if (didScroll) {
				hasScrolled();
				didScroll = false;
			}
		}, 50);
	}

	// checkbox
	$(".chk-group").each(function(k) {
		$(this).find("label").off("click").on("click", function() {
			if (!$(this).parent(".chk-group").hasClass("checked")) {
				$(this).parent(".chk-group").addClass("checked");
				alert("찜 목록에 추가되었습니다.");
			} else {
				$(this).parent(".chk-group").removeClass("checked");
				alert("찜 목록에서 삭제되었습니다.");
			}
		});
	});

	//product price calc
	if ($(".price.sale").length != 0) {
		priceCalc();

		$(".price.sale").each(function(e) {
			let oriPrice = parseInt($(this).find("del").text());
			let disCPrice = parseInt($(this).find("ins").text());
			oriPrice = oriPrice.toLocaleString();
			disCPrice = disCPrice.toLocaleString();
			$(this).find("del").text(oriPrice);
			$(this).find("ins").text(disCPrice);
		});
	}

	// product list
	if ($(".exhibit-cont").length != 0) {

		// price original evt 
		$(".exhibit-cont .exhibit-list .listBox .txt-info .price .original").each(function(e) {
			if ($(this).hasClass("keep")) {
				$(this).children(".rate-sale").detach();
				$(this).siblings().detach();
			}
		});
	}

	// product list category tab
	if ($(".exhibit-cont .exhibit-tab").length != 0) {
		$(".exhibit-cont .exhibit-tab li").each(function(a) {
			$(this).find("a").on("click", function() {
				$(".exhibit-cont .exhibit-tab li").removeClass("on");
				$(this).parent().addClass("on");
			});
		});

		$(".exhibit-cont .exhibit-list .listBox").each(function(e) {
			var listTxt = $.trim($(".exhibit-cont .exhibit-list .listBox").eq(e).find(".txt-info .tit .group").text());
			var listAreaTxt = $.trim($(".exhibit-cont .exhibit-list .listBox").eq(e).find(".txt-info .tit .area").text());

			$(".exhibit-cont .exhibit-tab li a").on("click", function() {
				var tabTxt = $.trim($(this).text());

				if (tabTxt == "전체") {
					$(".exhibit-cont .exhibit-list .listBox").show();
				} else if (tabTxt.includes(listTxt)) {
					$(".exhibit-cont .exhibit-list .listBox").hide();
					setTimeout(function() {
						$(".exhibit-cont .exhibit-list .listBox").eq(e).show();
					}, 1);
				} else if (tabTxt.includes(listAreaTxt)) {
					$(".exhibit-cont .exhibit-list .listBox").hide();
					setTimeout(function() {
						$(".exhibit-cont .exhibit-list .listBox").eq(e).show();
					}, 1);
				} else {
					$(".exhibit-cont .exhibit-list .listBox").hide();
				}
			});
		});
	}
	// product list area tab
	if ($(".exhibit-cont .area-desc .area-tab").length != 0) {
		$(".exhibit-cont .area-desc .area-tab li").each(function(e) {
			$(this).find("a").on("click", function() {
				$(".exhibit-cont .area-desc .area-tab li").removeClass("on");
				$(this).parent().addClass("on");
			});
		});
	}

	// product list rank tab
	if ($(".exhibit-cont .area-desc .rank-tab").length != 0) {
		$(".exhibit-cont .area-desc .rank-tab li").each(function(e) {
			$(this).find("a").on("click", function() {
				$(".exhibit-cont .area-desc .rank-tab li").removeClass("on");
				$(this).parent().addClass("on");
			});
		});
	}

	// product view tab
	if ($(".detailBox .detail-tab").length != 0) {
		$(".detailBox .detail-tab").each(function(e) {
			$(this).find("a").each(function(a) {
				if ($(this).hasClass("on")) {
					$(".detailBox .detail-desc > section").eq(a).show();
				}
				$(this).on("click", function() {
					$(".detailBox .detail-tab a").removeClass("on");
					$(".detailBox .detail-desc > section").hide();
					$(this).addClass("on");
					$(".detailBox .detail-desc > section").eq(a).show();
				});
			});
		});
	}

	// product flag
	if ($(".flag-desc").length != 0) {
		labeTxt();
	}

	// product view
	if ($(".proList-view").length != 0) {
		// sns
		$(".proList-view .top-cont .txt-desc .sns > a").on("click", function() {
			if (!$(this).hasClass("on")) {
				$(this).addClass("on");
				$(this).next().width("auto");
			} else {
				$(this).removeClass("on");
				$(this).next().width(0);
			}
		});

		// sns url clk evt
		$(".proList-view .top-cont .sns a.url").on("click", function() {
			urlCopy();
		});
		$(".proList-view .top-cont .sns a.facebook").on("click", function() {
			alert("URL 복사만 가능합니다.");
		});
		$(".proList-view .top-cont .sns a.twitter").on("click", function() {
			alert("URL 복사만 가능합니다.");
		});
	}

	//product view textarea info
	if ($("#qnaConts").length != 0)  {
		$("#qnaConts").on("change keyup", function() {
			$(".inquiry-txt .txtLength em").text($(this).val().length);

			if ($(this).val().length > 500) {
				alert("최대 500자까지 입력 가능합니다.");
				$(this).val($(this).val().substring(0, 500));
				$(".inquiry-txt .txtLength em").text(500);
			}
		});

		$(".inquiryBtn").on("click", function() {
			var qnaConts = $("#qnaConts").val().trim();

			if (qnaConts == "") {
				alert("내용을 입력해주세요.");
				$("#qnaConts").focus();
			} else {
				if (confirm("문의를 등록하시겠습니까?") == true) {
					alert("문의가 등록되었습니다.");
					$("#qnaContsWrite").text(qnaConts);
					$(".listViewForm").submit();
					$("#qnaConts").val("");
					$(".inquiry-txt .txtLength em").text(0);
				}
			}
		});
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

// product list : flag txt evt
function labeTxt() {
	var getText = $(".flag-desc .flag span.event");

	getText.each(function(g) {
		if ($.trim(getText.eq(g).text()) == '바로사용') {
			getText.eq(g).addClass("now");
		}
		else if ($.trim(getText.eq(g).text()) == '투데이특가') {
			getText.eq(g).addClass("today");
		}
		else if ($.trim(getText.eq(g).text()) == '쿠폰할인') {
			getText.eq(g).addClass("coupon");
		}
		else if ($.trim(getText.eq(g).text()) == 'MD추천') {
			getText.eq(g).addClass("md");
		} else {
			getText.eq(g).detach();
		}
	});
}

// product list : discount price evt
function priceCalc() {
	$(".price.sale").each(function(e) {
		//cost price
		var costPrice = $(this).find(".original del").text();
		costPrice = parseInt(costPrice);
		//sale price %
		var sale = $(this).find(".original .rate-sale em").text();
		sale = parseInt(sale);
		sale = sale / 100;
		// calc
		var priceCalc = costPrice - (costPrice * sale);
		// discounted price
		$(this).find("span.discount-price ins").text(priceCalc);

	});
}

// sns url clk evt
function urlCopy() {
	var url = "";
	var textarea = document.createElement("textarea");
	document.body.appendChild(textarea);
	url = window.document.location.href;
	textarea.value = url;
	textarea.select();
	document.execCommand("copy");
	document.body.removeChild(textarea);
	alert("URL이 복사되었습니다.");
}
