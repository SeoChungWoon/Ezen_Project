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
				} else {
					$(this).parent(".chk-group").removeClass("checked");
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
	
	// radio chk
	if ($(".radio-group").length != 0) {
    	$(".radio-desc").each(function (q) {
	        $(this).find(".radio-group").each(function (k) {
	            $(this).find("input[type='radio']").off("change").on("change", function () {
	                $(".radio-group").eq(q).find(".radio-group").removeClass("rChecked");
	                $(this).parent(".radio-group").addClass("rChecked");
	            });
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
			
			if(!$(id).is("#popup5")){

				$(this).addClass("modal-opened").attr("tabindex", "-1");
	
				$("html, body").css("overflow", "hidden");
				$("header").css("z-index", 3);
				$(".sub-body").css("z-index", "auto");
			}
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
	if ($(".localString").length != 0) {
		$(".localString").each(function(e) {
			let resCPrice = parseInt($(this).text());
			resCPrice = resCPrice.toLocaleString();

			$(this).text(resCPrice);
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
					if (confirm("등록하시겠습니까?") == true) {
						if (writeTxt.val().trim().length < 10) {
							alert(writeTxt.val().length);
							alert("최소 10자이상 입력가능합니다.");
							writeTxt.focus();
						} else {

							if ($(".inquiryBtn").eq(e).hasClass("qnaContsSubmit")) {
								$("#qnaContsWrite").text(qnaConts);
								$(".listViewForm").submit();
							} else if ($(".inquiryBtn").eq(e).hasClass("qnaContRevSubmit")) {
								
								if($("#rateCalc").val() == ""){
									alert("평점은 최소 별 한개이상 가능합니다.");
								}else{
									$(".listViewRevForm").submit();
								}
								
							}

							//writeTxt.val("");
							//$(".inquiryBtn").eq(e).parent().siblings("inquiry-txt").find(".txtLength em").text(0);
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
				$("#fileName").val("");
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
			if($(this).find("a.revRecomBtn").hasClass("on")){
				$(".pop_photo .txtInfo a.revRecomBtn").addClass("on");
			}
			
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
	// 나의 리뷰 삭제
	if($(".revDelBtn").length != 0){
		$(".reviewInfo").each(function(e){
			$(this).find(".revDelBtn").on("click", function(){
				var wUId = $(".reviewInfo").eq(e).find("#wUId").val();
				$.ajax({
					type: "post",
					url: "/product/listViewReDelProc.jsp",
					data: {"wUId" : wUId},
					success: function(txt) {
						$(".reviewRef").html(txt);
					}
				});
			});
		});
	}
	
	// 상품 예매하기
	if($(".reserveBox").length != 0){
		// 시간 선택
		$(".choiceBlock .timeChoice a").each(function(e){
			$(this).on("click", function(){
				$(".choiceBlock .timeChoice a").removeClass("on");
				$(this).addClass("on");
				
				$("#selectedTime").val($(this).text());
				$(".reservRst .time").text($(this).text());
				$(".resCPrice .price").text($("#realPrice").val());
				
				let cngPrice = parseInt($(".resCPrice .price").text());
				cngPrice = cngPrice.toLocaleString();
	
				$(".resCPrice .price").text(cngPrice);
			})
		});
		// 상품 예매하기 버튼
		$(".resBtn").on("click", function(){
			if($(".reservRst .date").text() == ""){
				alert("날짜를 선택해주세요");
			}else if($(".reservRst .time").text() == ""){
				alert("시간를 선택해주세요");
			}else{
				$("#popup5").show();
				var pResPNo = $("#rPNo").val();
				var pResUId = $("#rUId").val();
				var pResDate = $("#selectedDate").val();
				var pResTime = $("#selectedTime").val();
				var pResUseM = $("#savePrice").val();
				var pResRemainM = $("#remainPrice").val();
				var pResHead = $("#headCnt").val();
				var pResPrice = $("#realPrice").val();
				
				
				$("#pResDate").val(pResDate);
				$(".pop_reserve .desc-type .date dd").text(pResDate);
				$("#pResTime").val(pResTime);
				$(".pop_reserve .desc-type .time dd").text(pResTime);
				$("#pResUseM").val(pResUseM);
				$(".pop_reserve .desc-type .useSM dd").text(pResUseM);
				$("#ePay").val(pResRemainM);
				$(".pop_reserve .desc-type .remainSM dd").text(pResRemainM);
				$("#pResHead").val(pResHead);
				$(".pop_reserve .desc-type .headCnt dd .num").text(pResHead);
				$("#pResPrice").val(pResPrice);
				$(".pop_reserve .desc-type .getPrice .price").text(pResPrice);
				
				let resCPrice = parseInt($(".getPrice .price").text().trim());
				resCPrice = resCPrice.toLocaleString();
				$(".getPrice .price").text(resCPrice);
			}
		});
		
		var cntNum = 1;
		var oriPriceCalc = $("#realPrice").val();
		$("#orisavelPrice").val($("#oriRealPrice").val());
		// 적립금
		$(".resSMList .resSMChk label").on("click", function(){
			if($(".reservRst .date").text() == ""){
				alert("날짜를 선택해주세요");
				$(this).parent(".resSMChk").removeClass("checked");
			}else if($(".reservRst .time").text() == ""){
				alert("시간를 선택해주세요");
				$(this).parent(".resSMChk").removeClass("checked");
			}else{
				if(!$(this).parent("").hasClass("checked")){
					if( parseInt($("#oriMPrice").val()) >= parseInt($("#realPrice").val())){
						alert("적립금은 결제 금액보다 적을 경우 사용 가능합니다.");
					}else{
						cntNum = 1;
						$(".resHeadCnt .cntNum").text("1");
						$("#headCnt").val(cntNum);
						$(".resCPrice .price").text($("#oriRealPrice").val() * cntNum);
						$("#realPrice").val($("#oriRealPrice").val() * cntNum);
						
						$(this).parent("").addClass("checked");
						
						let resCPrice = parseInt($(".resCPrice .price").text().trim());
						resCPrice = resCPrice.toLocaleString();
						$(".resCPrice .price").text(resCPrice);
						
						if (!$(this).parent("").hasClass("checked")) {
							$("#resSMP").attr("disabled", true);
						} else {
							$("#resSMP").attr("disabled", false).focus();
						}
						
					}
				}else{
					$(this).parent("").removeClass("checked");
				}
			}
		});
		
		$(".increase").on("click",function(){
			if($(".reservRst .date").text() == ""){
				alert("날짜를 선택해주세요");
			}else if($(".reservRst .time").text() == ""){
				alert("시간를 선택해주세요");
			}else{
				if($(this).siblings("span").text() >= 5){
					$(".increseRed").show();
					$(".decreseRed").hide();
					$(".resHeadCnt .cntNum").text("5");
					cntNum = 5;
				}else{
					cntNum++;
					$(".increseRed").hide();
					$(".decreseRed").hide();
					$(this).siblings("span").text(cntNum);
					$("#headCnt").val(cntNum);
					
					var headRCnt =  parseInt($("#orisavelPrice").val().trim()) * cntNum;
					$(".resCPrice .price").text(headRCnt);
					$("#realPrice").val(headRCnt);
					
					let resCPrice = parseInt($(".resCPrice .price").text().trim());
					resCPrice = resCPrice.toLocaleString();
					$(".resCPrice .price").text(resCPrice);
				}
			}
		});
		
		$(".decrease").on("click",function(){
			if($(".reservRst .date").text() == ""){
				alert("날짜를 선택해주세요");
			}else if($(".reservRst .time").text() == ""){
				alert("시간를 선택해주세요");
			}else{
				if($(this).siblings("span").text() < 2){
					$(".decreseRed").show();
					$(".increseRed").hide();
					$(".resHeadCnt .cntNum").text("1");
					cntNum = 1;
				}else{
					cntNum--;
					$(".decreseRed").hide();
					$(".increseRed").hide();
					$(this).siblings("span").text(cntNum);
					$("#headCnt").val(cntNum);
					
					var headRCnt =  parseInt($("#realPrice").val().trim()) - parseInt($("#orisavelPrice").val().trim());
					$(".resCPrice .price").text(headRCnt);
					$("#realPrice").val(headRCnt);
					
					let resCPrice = parseInt($(".resCPrice .price").text().trim());
					resCPrice = resCPrice.toLocaleString();
					$(".resCPrice .price").text(resCPrice);
				}
				
			}
		});
		
		$("#resSMP").on("change", function() {
			
			if($(this).val() <= 5000 && $(this).val() <= $("#oriMPrice").val()){
					
				$(".remainSM .charge").text($("#oriMPrice").val());
				$("#orisavelPrice").val($("#oriRealPrice").val());
				$("#remainPrice").val($("#oriMPrice").val());
				$("#realPrice").val($("#oriRealPrice").val());
				$("#savePrice").val("0");
				$(".resCPrice .price").text($("#oriRealPrice").val());
				$(".maxSMChk").removeClass("checked");
				cntNum = 1;
				$(".resHeadCnt .cntNum").text("1");
				$("#headCnt").val("1");
				
				// 사용 적립금
				$("#savePrice").val($(this).val().trim());
				// 남은 적립금
				$("#remainPrice").val($(".remainSM .charge").text());
		
				// 남은 적립금
				var remainPrice = parseInt($(".remainSM .charge").text().trim());
				var resSMP = $("#resSMP").val();
				var remainCng = remainPrice - resSMP;
				$("#remainPrice").val(remainCng);
				$(".remainSM .charge").text(remainCng);
				$("#orisavelPrice").val($("#oriRealPrice").val() - $("#savePrice").val());
				
				// 총 결제 금액
				var realPrice = $("#realPrice").val(); 
				var savePrice = $("#savePrice").val(); 
				var saleCalc = realPrice - savePrice;
				$("#realPrice").val(saleCalc);
				
				var cngPrice = parseInt(saleCalc);
				cngPrice = cngPrice.toLocaleString();
				$(".resCPrice .price").text(cngPrice);
				
				$(".resSMList p.redTxt").hide();
				$(".resSMList p.redOverTxt").hide();
				$("#resSMP").removeClass("red");
				
			}else if($(this).val() > 5000){
				$(".resSMList p.redTxt").show();
				$("#resSMP").addClass("red");
				
				$(".remainSM .charge").val($("#oriMPrice").val());
				$(this).val("0").focus();
				$("#savePrice").val($("#oriMPrice").val());
				$(".remainSM .charge").text($("#oriMPrice").val());
				
			}else if($(this).val() > $("#oriMPrice").val()){
				$(".resSMList p.redOverTxt").show();
				$("#resSMP").addClass("red");
				
				$(".remainSM .charge").val($("#oriMPrice").val());
				$(this).val("0").focus();
				$("#savePrice").val($("#oriMPrice").val());
				$(".remainSM .charge").text($("#oriMPrice").val());
				
			}
		});
		
		$(".maxSMChk").each(function(e){
			$(this).find("label").on("click", function(){
				if($(".resSMList .resSMChk").hasClass("checked")){
					if(!$(".maxSMChk").hasClass("checked") &&  parseInt($("#oriMPrice").val()) >= 5000){
						$(".maxSMChk").addClass("checked");
						
						cntNum = 1;
						$(".resHeadCnt .cntNum").text("1");
						$("#headCnt").val(cntNum);
						
						$("#orisavelPrice").val($("#oriRealPrice").val());
						$(".remainSM .charge").text($("#oriMPrice").val());
						$("#remainPrice").val($("#oriMPrice").val());
						$("#realPrice").val($("#oriRealPrice").val());
						$(".resCPrice .price").text($("#oriRealPrice").val());
						if($("#resSMP").val() < 5000){
							$("#resSMP").val($("#oriMPrice").val());
							$("#savePrice").val($("#oriMPrice").val());
						}else{
							$("#resSMP").val("5000");
							$("#savePrice").val("5000");
						}
						
						// 남은 적립금
						var remainPrice = parseInt($(".remainSM .charge").text().trim());
						var resSMP = $("#resSMP").val();
						var remainCng = remainPrice - resSMP;
						$("#remainPrice").val(remainCng);
						$("#orisavelPrice").val($("#oriRealPrice").val() - 5000);
						$(".remainSM .charge").text(remainCng);
						
						// 총 결제 금액
						var realPrice = $("#realPrice").val(); 
						var savePrice = $("#savePrice").val(); 
						var saleCalc = realPrice - savePrice;
						$("#realPrice").val(saleCalc);
						
						var cngPrice = parseInt(saleCalc);
						cngPrice = cngPrice.toLocaleString();
						$(".resCPrice .price").text(cngPrice);
					}else{
						$(".maxSMChk").removeClass("checked");
					}
				}
			});
		});
	}
	
	if($(".reservePop").length != 0){
		$("#pResCPay").val($(".radio-group.rChecked label").text());
		$("#resSel").on("change", function(){
			$("#pResCAccount").val($("#resSel option:selected").val());
		});
		
		$(".chargeBtn").on("click", function(){
			var pResPNo = $("#pResPNo").val();
			var pResUId = $("#pResUId").val();
			var pResDate = $("#pResDate").val();
			var pResTime = $("#pResTime").val();
			var pResUseM = $("#pResUseM").val();
			var ePay = $("#ePay").val();
			var pResHead = $("#pResHead").val();
			var pResPrice = $("#pResPrice").val();
			var pResCPay = $("#pResCPay").val();
			var pResCAccount = $("#pResCAccount").val();
			
			if($("#pResCAccount").val() == ""){
				alert("결제 수단을 선택해주세요.");
				$("#resSel").focus();
			}else{
				$.ajax({
					type: "post",
					url: "/product/listReserveProc.jsp",
					data: {"pResPNo" : pResPNo, "pResUId" : pResUId, "pResDate" : pResDate, "pResTime" : pResTime, "pResUseM" : pResUseM, "pResRemainM" : ePay, "pResHead" : pResHead, "pResPrice" : pResPrice, "pResCPay" : pResCPay, "pResCAccount" : pResCAccount},
					success: function(txt) {
						$(".reserveHidden").html(txt);
					}
				});
			}
		});
	};
		
	
	
	
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
				$(this).css({"color": "red"});
				gsap.to($(this).siblings("div").find("span.percentBar"), 0.7, { width: percent+"%", ease: Power3.easeOut });
				$(this).siblings("div").find("span.percentBar").css({"background-color": "#0086b8"});
			} else if (result==0) {
				$(this).html("D-Day");
				$(this).siblings("div").find("span.percentBar").css({"width": "100%", "background-color": "e64949"});
			} else {
				$(this).html("종료");
				$(this).css({"background-color": "#ddd", "color": "#222"});
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
		if($(".discount-price").length > 0){
			$(this).find("span.discount-price ins").text(priceCalc);
			$("#realPrice").val(priceCalc);
			$("#oriRealPrice").val(priceCalc);
		}else{
			$("#realPrice").val($("#oriPrice").val());
			$("#oriRealPrice").val($("#oriPrice").val());
		}

		// not sale
		if ($(this).children("span").length < 2) {
			$(this).find(".original").addClass("keep");
		}
	});
}

// review file명 불러오기
function fileVal(a)
{
	//$("#fileName").val(a.files[0].name);
	// 업로드 파일 제한
	//fileName : 파일 경로 (C:\fakepath\파일이름.확장명)
	let pWfile = $("#pWfile").val().trim();
	let fileName = pWfile.substring(12);
	$("#fileName").val(fileName);
	
	// extension. 확장자, lastIndexOf : idx 번호 가져옴, dotIdx : 의 위치 (위로써는 16)
	let dotIdx = pWfile.lastIndexOf(".");
	let ext = pWfile.substring(dotIdx + 1); // ''.확장명'을 +1 해서 '확장명'
	ext = ext.toLowerCase(); // 대소문자 모두 소문자로 변경
	
	
	let forbidExt = ["jpg", "png", "gif"]; // 허용된 확장명들
	let chk = false;
	
	for (let x of forbidExt) {
		if (x == ext) {
			chk = true;
		}
	}
	
	if (!chk) {
		alert("확장자가 " + ext + "인 파일은 업로드 하실 수 없습니다.");
		$(".fileBtn").focus();
	} else{
		$(".file-name").css("display", "flex");
		$(".file-name span").text(a.files[0].name);
		//$("#fileName").val(a.files[0].name);
		
		let x = document.getElementById("pWfile");
		//let len = x.files.length; // 업로드할 파일의 개수
		let fileSize = x.files[0].size; // 업로드되는 파일을 배열로 처리

		if (fileSize > 10 * 1024 * 1024) {
			alert("최대 업로드 크기는 10MB입니다.");
			$("#pWfile").val("").clone(true);
			$(".fileBtn").focus();
		}
	}
	
	if($(".file-name").display == "flex"){
		
	}
	
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
	
	// 나의 리뷰 삭제
	if($(".revDelBtn").length != 0){
		$(".reviewInfo").each(function(e){
			$(this).find(".revDelBtn").on("click", function(){
				var wUId = $(".reviewInfo").eq(e).find("#wUId").val();
				$.ajax({
					type: "post",
					url: "/product/listViewReDelProc.jsp",
					data: {"wUId" : wUId},
					success: function(txt) {
						$(".reviewRef").html(txt);
					}
				});
			});
		});
	}
}
//dim show
function modalDimOpen(id) {
	var id = id;
	$(".pop_dimd").addClass("in").fadeIn(300);
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

	if($(id).hasClass("reviewBtn")){
		window.location.reload();
	}
}
// dim hide
function modalDimClose(id) {
	var id = id;
	$(".pop_dimd").removeClass("in").fadeOut(400);
}
