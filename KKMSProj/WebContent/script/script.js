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
			gsap.to($("header"), 0.4, { height: "auto", ease: Power3.easeOut });
		}).on("mouseleave", function() {
			$(".hUtil").css("z-index", 2);
			gsap.to($("header"), 0.4, { height: 100, ease: Power3.easeOut });
		});


		$(window).on("scroll", function() { // scroll
			// header
			didScroll = true;

			// top btn
			if ($(".quick_div .top_btn").length != 0) {

				if ($(window).scrollTop() > 100) {
					$(".quick_div .top_btn").fadeIn(300);
				} else {
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
	if ($(".chk-group").length != 0) {
		$(".chk-group").each(function(k) {
			$(this).find("label").off("click").on("click", function() {
				if (!$(this).parent(".chk-group").hasClass("checked")) {
					$(this).parent(".chk-group").addClass("checked");


					if ($(this).parent(".chk-group").hasClass("like")) {
						alert("찜 목록에 추가되었습니다.");
					}
				} else {
					$(this).parent(".chk-group").removeClass("checked");

					if ($(this).parent(".chk-group").hasClass("like")) {
						alert("찜 목록에서 삭제되었습니다.");
					}
				}
			});
		});
	}
	// checkbox star
	if ($(".rateChk").length != 0) {
		$(".rateCalc").find(".set").text($(this).parent(".chk-group.checked").length);

		$(".rateChk").each(function(e) {
			$(this).find(".chk-group label").off("click").on("click", function(a) {
				$(this).parent(".chk-group").addClass("checked");
				$(this).parent(".chk-group").prevAll().addClass("checked");
				$(this).parent(".chk-group").nextAll().removeClass("checked");
				
				var chkLeng = $(".rateChk").eq(e).find(".chk-group.checked").length;
				$("#rateCalc").val(chkLeng);
			});
		});
	}

	
	//찜 목록 버튼
	if ($(".likeClk").length != 0) {
		$(".likeClk label").on("click", function(){
				
				let wish = $(this).prev().is(":checked");
				let pNo = $(this).prev().prev().val();
				let uId = $(this).prev().prev().prev().val();
				uId = uId.trim();
				if(uId=="null") {
					alert("로그인 후 이용 가능합니다.");
					location.href="/member/login.jsp";
					return;
				} else {
				
					if(!wish){
						$(this).parent(".chk-group").addClass("checked");
						$.ajax({
							type: "post",
							url: "/product/wishProc.jsp",
							data: { "uId": uId, "pNo": pNo, "wish": wish },
							success: function(txt) {
								alert("찜 목록에 추가되었습니다.");
							}
						});
					} else {
						$(this).parent(".chk-group").removeClass("checked");
						$.ajax({
							type: "post",
							url: "/product/wishProc.jsp",
							data: { "uId": uId, "pNo": pNo, "wish": wish },
							success: function(txt) {
								alert("찜 목록에서 삭제되었습니다.");
							}
						});
					}	
				}
		});	
	}

	//popup
	if ($(".btn.open-modal").length != 0) {
		$(document).on("click", ".btn.open-modal", function(e) {
			var id = '#' + $(this).attr("data-target");

			$(this).addClass("modal-opened").attr("tabindex", "-1");

			$("html, body").css("overflow", "hidden");
			$("header").css("z-index", 3);
			$(".sub-body").css("z-index", "auto");

			modalOpen(id);
			return false;
		});

		$(document).on("click", ".close-modal", function() {
			var id = "#" + $(this).closest(".modal").attr("id");

			$("html, body").css("overflow", "visible");
			$("header").css("z-index", 10);

			modalClose(id);

			if($(this).parents(".pop_wrap").find("textarea").length > 0){
				if (confirm("창을 닫으시겠습니까? 내용이 초기화됩니다.") == true) {
					$(this).parent().siblings(".pop_div").find("textarea").val("");
				}
			}
		});
	}
	// review img 미리보기
	if ($("a.btn.pPreview").length != 0) {
		$("a.btn.pPreview").each(function(e){
			$(this).on("click", function(){
				var btnImg = $(this).children("img").attr("src");
				var btnData = $(this).attr("data-target");
				
				if($(".pop_wrap.modal").is("#"+btnData)){
					$(".pop_wrap.modal#"+btnData).find(".img").find("img").attr("src", btnImg);
				}
			});
		});
	}
	// photo review pop
	if ($("a.btn.photoList").length != 0) {
		$("a.btn.photoList").each(function(e){
			$(".reviewBox .revList li").each(function(a){
				$("a.btn.photoList").eq(e).on("click", function(){
					var btnData = $(this).attr("data-target");
					var btnImg = $(this).children("img").attr("src");
					var listImg = $(".reviewBox .revList li").eq(a);
					
					if(btnImg == listImg.find("img").attr("src")){
						var rate = listImg.find(".star-rating .rateChk").html();
						var txt = listImg.find(".txt-area .txt").html();
						var txtInfo = listImg.find(".txtInfo").html();
					}
					
					if($(".pop_wrap.modal").is("#"+btnData)){
						$(".pop_wrap.modal#"+btnData).find(".star-rating .rateChk").html(rate);
						$(".pop_wrap.modal#"+btnData).find(".txt").html(txt);
						$(".pop_wrap.modal#"+btnData).find(".txtInfo").html(txtInfo);
					}	
				});
			});
		});
	}
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


	// product view COMMON
	if ($(".sns-line").length != 0) {
		// sns
		$(".sns-line .sns > a").on("click", function() {
			if (!$(this).hasClass("on")) {
				$(this).addClass("on");
				$(this).next().width("auto");
			} else {
				$(this).removeClass("on");
				$(this).next().width(0);
			}
		});

		// sns url clk evt
		$(".sns-line .sns a.url").on("click", function() {
			urlCopy();
		});
		$(".sns-line .sns a.facebook").on("click", function() {
			alert("URL 복사만 가능합니다.");
		});
		$(".sns-line .sns a.twitter").on("click", function() {
			alert("URL 복사만 가능합니다.");
		});
	}


	//product view textarea info
	if ($(".qnaWrite").length != 0) {
		var txtLength = 500;

		// 상품내용 문의
		$(".qnaWrite").each(function(e) {
			$(this).on("change keyup", function() {

				$(this).next(".txtLength").find("em").text($(this).val().trim().length);

				if ($(this).val().trim().length > txtLength) {
					alert("최대 500자까지 입력 가능합니다.");
					$(this).val($(this).val().substring(0, txtLength));
					$(this).next(".txtLength").find("em").text(txtLength);
				}
			});
		});

		$(".inquiryBtn").each(function(e) {
			$(this).on("click", function() {
				var writeTxt = $(this).parent().siblings(".inquiry-txt").children(".qnaWrite");
				var qnaConts = writeTxt.val();

				if (qnaConts == "") {
					alert("내용을 입력해주세요.");
					writeTxt.focus();
				} else {
					if (confirm("문의를 등록하시겠습니까?") == true) {
						if (writeTxt.val().trim().length < 10) {
							alert(writeTxt.val().length);
							alert("최소 10자이상 입력가능합니다.");
						} else {

							if ($(".inquiryBtn").eq(e).hasClass("qnaContsSubmit")) {
								alert("판매자");
								$("#qnaContsWrite").text(qnaConts);
								$(".listViewForm").submit();
							} else if ($(".inquiryBtn").eq(e).hasClass("qnaContRevSubmit")) {
								alert("리뷰");
								$(".listViewRevForm").submit();
							}

							writeTxt.val("");
							$(".inquiryBtn").eq(e).parent().siblings("inquiry-txt").find(".txtLength em").text(0);
						}
					}
				}
			});
		});

		$(".btn-cont .reset").on("click", function() {
			var writeTxt = $(this).parent().siblings(".inquiry-txt").children(".qnaWrite");
			var qnaConts = $(this).parent().siblings(".inquiry-txt").children(".qnaWrite").val().trim();
			if (qnaConts == "") {
				alert("내용을 입력해주세요.");
				writeTxt.focus();
			} else {
				if (confirm("작성글을 초기화하시겠습니까?") == true) {
					writeTxt.val("");
					writeTxt.focus();
				}
			}
		});
	}

	// 판매자 문의 수정
	if ($("#qnaContsWrite").length != 0) {

		if ($("#qnaContsWrite").val() != "") {
			$("#qnaContsWrite").siblings(".txtLength").find("em").text($("#qnaContsWrite").val().trim().length);
		} else {
			$("#qnaContsWrite").siblings(".txtLength").find("em").text(0);
		}

		$(".modBtn").parent().siblings("textarea").on("change keyup", function() {
			$(this).text($(this).text());
		});

		// 수정 버튼
		$(".modBtn").on("click", function() {
			var modData = $(".modBtn").parent().siblings("textarea").val().trim();

			if (!($(this).parent().siblings("textarea").attr("disabled", false).hasClass("on"))) {
				$(this).parent().siblings("textarea").attr("disabled", false).addClass("on").focus();
				$(this).text("확인");

			} else {
				if (modData == "" || modData.length == 0) {
					alert("내용을 입력해주세요.");
					$(".modBtn").parent().siblings("textarea").focus();
				} else {
					if (confirm("수정하시겠습니까?") == true) {
						if (modData.length < 10) {
							alert("최소 10자이상 작성해야합니다.");
						} else {
							$(this).parent().siblings("textarea").attr("disabled", false).removeClass("on");
							$(".modBtn").parent().siblings("textarea").text(modData);
							$(".listViewFormRe").submit();
							$(this).text("수정");
						}
					}
				}
			}
		});

		// 삭제 버튼
		$(".delBtn").on("click", function() {
			if (confirm("문의를 삭제하시겠습니까?") == true) {
				$(".listViewFormRe").attr("action", "/product/listViewDelProc.jsp").submit();
			}
		});
	}
	// 리뷰 작성
	if ($(".pop_review").length != 0) {
		$(".file-group").each(function(e){
			// 파일 첨부
			$(this).find(".fileBtn").on("click", function(e){
				e.preventDefault();
				$(this).siblings("input[type=file]").click();
			});
			// 파일 첨부 삭제
			$(this).find(".file-name .fileDel").on("click", function(e){
				$(this).siblings("span").text("");
				$(this).parent().hide();
			});
		});
	}
	// 리뷰 ID 가리기
	if ($(".reviewInfo .txt-area .txtInfo .wUseId").length != 0) {
		$(".reviewInfo .txt-area .txtInfo .wUseId").each(function(e){
			var idTxt = $(".wUseId span").eq(e).text();
	
			if (idTxt.length) { 
				var vResult = idTxt; 
				vResult = vResult.substring(0, vResult.length - 2); 
				vResult += "**";
				 idTxt = vResult;
			}
			$(".wUseId span").eq(e).text(idTxt);
		});

	}
	// 리뷰 좋아요
	if($(".reviewInfo .txtInfo").length != 0){
		$(".txtInfo").each(function(e){
			$(this).find("a.revRecomBtn").on("click", function(){
				var cnt = $(this).find("em").text();
				
				if(!$(this).hasClass("on")){
					$(this).addClass("on");
					cnt++;
					$(this).find("em").text(cnt);
					$(".txtInfo").eq(e).find("#wRecom").val(cnt);
					
					var wRecom = $(".txtInfo").eq(e).find("#wRecom").val();
					var wPNo = $(".txtInfo").eq(e).find("#wPNo").val();
					var wUId = $(".txtInfo").eq(e).find("#wUId").val();
					
					$.ajax({
						type: "post",
						url: "/product/listReviewCntProc.jsp",
						data: { "wRecom": wRecom, "wPNo" : wPNo, "wUId" : wUId},
						success: function(txt) {
						}
					});
				}else{
					$(this).removeClass("on");
					cnt--;
					$(this).find("em").text(cnt);
					$(".txtInfo").eq(e).find("#wRecom").val(cnt);
					
					var wRecom =$(".txtInfo").eq(e).find("#wRecom").val();
					var wPNo = $(".txtInfo").eq(e).find("#wPNo").val();
					var wUId = $(".txtInfo").eq(e).find("#wUId").val();
					
					$.ajax({
						type: "post",
						url: "/product/listReviewCntProc.jsp",
						data: { "wRecom": wRecom, "wPNo" : wPNo, "wUId" : wUId},
						success: function(txt) {
						}
					});
				}
			});
		});
	}


	// swiper
	// review
	if ($(".photo-list").length != 0) {
		var revSwiper = new Swiper('.photo-list', {
			slidesPerView: "auto",
			spaceBetween: 10,
			observer: true,
			observeParents: true,
			navigation: {
				nextEl: '.photo-list .swiper-button-next',
				prevEl: '.photo-list .swiper-button-prev',
			},
		});
	}
	if ($(".wishSwiper").length != 0) {
		var revSwiper = new Swiper('.wishSwiper', {
			slidesPerView: "auto",
			spaceBetween: 10,
			observer: true,
			observeParents: true,
			navigation: {
				nextEl: '.wishSwiper .swiper-button-next',
				prevEl: '.wishSwiper .swiper-button-prev',
			},
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
	
	if ($("#eventReplyTxt").length != 0) {
		$(".quick_div .reply_btn").show();
	} else {
		$(".quick_div .reply_btn").hide();
	}
	
	if ($("#idArea").length != 0) {
		$("#memberid").focus();
	}
	
	if ($("#eventAlarm").length != 0) {
		$(".eventDday").each(function(e){
			let date = new Date();
			let today = new Date(date.getFullYear(), date.getMonth()+1, date.getDate());
			let dDate = $(this).siblings("div").find("span.eDate").eq(1).text();
			let dYear = dDate.substring(0, 4);
			let dMonth = dDate.substring(5, 7);
			let dDay = dDate.substring(8, 10);
			let lastDay = new Date(dYear, dMonth, dDay);
			let gap = lastDay.getTime() - today.getTime();
			let result = Math.ceil(gap / (1000 * 60 * 60 * 24));
			if(result>0){
				let percent = 100-((result/50)*100);
				$(this).html("D - " + result);
				$(this).css({"color": "red", "font-weight": "bold"});
				gsap.to($(this).siblings("div").find("span.percentBar"), 0.7, { width: percent+"%", ease: Power3.easeOut });
				$(this).siblings("div").find("span.percentBar").css({"background-color": "blue"});
			} else if (result==0) {
				$(this).html("D-Day");
				$(this).siblings("div").find("span.percentBar").css({"width": "100%", "background-color": "red"});
			} else {
				$(this).html("이미 종료된 이벤트입니다.");
				$(this).siblings("div").find("span.percentBar").css({"width": "100%", "background-color": "grey"});
			}
		});
	}
		
	if ($(".likeClk").length != 0) {
		$(".wishChk").each(function(e){
			if($(".wishChk").eq(e).val()=="true") {
				$(this).prop("checked", true);
				$(this).parent(".chk-group").addClass("checked");
			} 
		});
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
		
		// not sale
		if($(this).children("span").length < 2){
			$(this).find(".original").addClass("keep");
		}

	});
}
// review file명 불러오기
function fileVal(a)
{
	$(".file-name span").text(a.files[0].name);
	$(".file-name").css("display", "flex");
	$("#fileName").val(a.files[0].name);
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

// popup //
function modalOpen(id) {
	var id = id;

	$("body").addClass("modal-open");
	$(id).addClass("in").show();

	modalDimOpen(id); //dim show

	//return false;
}
//dim show
function modalDimOpen(id) {
	var id = id;
	$(".pop_dimd").addClass("in").fadeIn(400);
	$("header").css("z-index", 3);
	$(".sub-body").css("z-index", "auto");
}

function modalClose(id) {
	var id = id;

	if ($(".modal.in").length < 2) {
		$("body").removeClass("modal-open");
	}

	modalDimClose(id);
	$(id).removeClass("in").hide();

	$(".modal-opened").focus().attr("tabindex", "0").removeClass("modal-opened");
	$("header").css("z-index", 10);

}
// dim hide
function modalDimClose(id) {
	var id = id;
	$(".pop_dimd").removeClass("in").fadeOut(400);
}
