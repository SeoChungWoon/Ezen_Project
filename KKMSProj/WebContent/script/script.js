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

	//??? ?????? ??????
	if ($(".likeClk").length != 0) {
		$(".likeClk label").on("click", function(){
				
				let wish = $(this).prev().is(":checked");
				let pNo = $(this).prev().prev().val();
				let uId = $(this).prev().prev().prev().val();
				uId = uId.trim();
				if(uId=="null") {
					alert("????????? ??? ?????? ???????????????.");
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
								alert("??? ????????? ?????????????????????.");
							}
						});
					} else {
						$(this).parent(".chk-group").removeClass("checked");
						$.ajax({
							type: "post",
							url: "/product/wishProc.jsp",
							data: { "uId": uId, "pNo": pNo, "wish": wish },
							success: function(txt) {
								alert("??? ???????????? ?????????????????????.");
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
	
				modalOpen(id);
			}
			
			return false;
		});

		$(document).on("click", ".close-modal", function() {
			var id = "#" + $(this).closest(".modal").attr("id");

			$("html, body").css("overflow", "visible");
			$("header").css("z-index", 10);

			modalClose(id);

			if($(this).parents(".pop_wrap").find("textarea").length > 0){
				if (confirm("?????? ?????????????????????? ????????? ??????????????????.") == true) {
					$(this).parent().siblings(".pop_div").find("textarea").val("");
				}
			}
		});
	}
	
	// review img ????????????
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
	if ($(".revList").length != 0) {
		$(".revList .chk-group a").off("click").on("click", function(e){
			e.preventDefault();
			e.stopPropagation();
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

				if (tabTxt == "??????") {
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
			alert("URL ????????? ???????????????.");
		});
		$(".sns-line .sns a.twitter").on("click", function() {
			alert("URL ????????? ???????????????.");
		});
	}

	//product view textarea info
	if ($(".qnaWrite").length != 0) {
		var txtLength = 500;

		// ???????????? ??????
		$(".qnaWrite").each(function(e) {
			$(this).on("change keyup", function() {

				$(this).next(".txtLength").find("em").text($(this).val().trim().length);

				if ($(this).val().trim().length > txtLength) {
					alert("?????? 500????????? ?????? ???????????????.");
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
					alert("????????? ??????????????????.");
					writeTxt.focus();
				} else {
					if (confirm("?????????????????????????") == true) {
						if (writeTxt.val().trim().length < 10) {
							alert(writeTxt.val().length);
							alert("?????? 10????????? ?????????????????????.");
							writeTxt.focus();
						} else {

							if ($(".inquiryBtn").eq(e).hasClass("qnaContsSubmit")) {
								$("#qnaContsWrite").text(qnaConts);
								$(".listViewForm").submit();
							} else if ($(".inquiryBtn").eq(e).hasClass("qnaContRevSubmit")) {
								
								if($("#rateCalc").val() == ""){
									alert("????????? ?????? ??? ???????????? ???????????????.");
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
				alert("????????? ??????????????????.");
				writeTxt.focus();
			} else {
				if (confirm("???????????? ????????????????????????????") == true) {
					writeTxt.val("");
					writeTxt.focus();
				}
			}
		});
	}


	// ????????? ?????? ??????
	if ($("#qnaContsWrite").length != 0) {

		if ($("#qnaContsWrite").val() != "") {
			$("#qnaContsWrite").siblings(".txtLength").find("em").text($("#qnaContsWrite").val().trim().length);
		} else {
			$("#qnaContsWrite").siblings(".txtLength").find("em").text(0);
		}

		$(".modBtn").parent().siblings("textarea").on("change keyup", function() {
			$(this).text($(this).text());
		});

		// ?????? ??????
		$(".modBtn").on("click", function() {
			var modData = $(".modBtn").parent().siblings("textarea").val().trim();

			if (!($(this).parent().siblings("textarea").attr("disabled", false).hasClass("on"))) {
				$(this).parent().siblings("textarea").attr("disabled", false).addClass("on").focus();
				$(this).text("??????");

			} else {
				if (modData == "" || modData.length == 0) {
					alert("????????? ??????????????????.");
					$(".modBtn").parent().siblings("textarea").focus();
				} else {
					if (confirm("?????????????????????????") == true) {
						if (modData.length < 10) {
							alert("?????? 10????????? ?????????????????????.");
						} else {
							$(this).parent().siblings("textarea").attr("disabled", false).removeClass("on");
							$(".modBtn").parent().siblings("textarea").text(modData);
							$(".listViewFormRe").submit();
							$(this).text("??????");
						}
					}
				}
			}
		});

		// ?????? ??????
		$(".delBtn").on("click", function() {
			if (confirm("????????? ?????????????????????????") == true) {
				$(".listViewFormRe").attr("action", "/product/listViewDelProc.jsp").submit();
			}
		});
	}
	// ?????? ??????
	if ($(".file-group").length != 0) {
		$(".file-group").each(function(e){
			// ?????? ??????
			$(this).find(".fileBtn").on("click", function(e){
				e.preventDefault();
				$(this).siblings("input[type=file]").click();
			});
			// ?????? ?????? ??????
			$(this).find(".file-name .fileDel").on("click", function(e){
				$(this).siblings("span").text("");
				$(this).parent().hide();
				$("#fileName").val("");
			});
		});
	}
	// ?????? ID ?????????
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
	// ?????? ?????????
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
	// ?????? ?????? ??????
	if($(".revDelBtn").length != 0){
		$(".reviewInfo").each(function(e){
			$(this).find(".revDelBtn").on("click", function(){
				var wUId = $(".reviewInfo").eq(e).find("#wUId").val();
				var wPNo = $("#wPNo").val();
				if(confirm("????????? ?????????????????????????") == true) {
					$.ajax({
						type: "post",
						url: "/product/listViewReDelProc.jsp",
						data: {"wUId" : wUId, "wPNo" : wPNo},
						success: function(txt) {
							alert("????????? ?????????????????????.");
							location.reload();
						}
					});					
				} else {
					return;
				}
			});
		});
	}
	// ????????????????????? ?????? ?????? ??????
	if($(".myReviewDel").length != 0){
		$(".myReviewRow").each(function(e){
			$(this).find(".myReviewDel").on("click", function(){
				var wUId = $(".mypageId").text();
				wUId = wUId.trim();
				var wPNo = $(".myReviewRow").eq(e).find(".rPNo").val();
				if(confirm("????????? ?????????????????????????") == true) {
					$.ajax({
						type: "post",
						url: "/product/listViewReDelProc.jsp",
						data: {"wUId" : wUId, "wPNo" : wPNo},
						success: function(txt) {
							alert("????????? ?????????????????????.");
							location.reload();						
						}
					});					
				} else {
					return;
				}
			});
		});
	}
	
	// ?????? ????????????
	if($(".reserveBox").length != 0){
		// ?????? ??????
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
		// ?????? ???????????? ??????
		$(".resBtn").on("click", function(){
			if($(".reservRst .date").text() == ""){
				alert("????????? ??????????????????");
			}else if($(".reservRst .time").text() == ""){
				alert("????????? ??????????????????");
			}else{
				$("#popup5").show();
				
				modalDimOpen($("#popup5")); //dim show
				var pResPNo = $("#rPNo").val();
				var pResUId = $("#rUId").val();
				var pResDate = $("#selectedDate").val();
				var pResTime = $("#selectedTime").val();
				var pResUseM = $("#savePrice").val();
				var pResRemainM = $("#remainPrice").val();
				var pResHead = $("#headCnt").val();
				var pResPrice = $("#realPrice").val();
				var pResplanM = parseInt($("#realPrice").val()) * 0.01;
				console.log(parseInt($("#realPrice").val()))
				
				
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
				$("#pResplanM").val(pResplanM);
				$(".pop_reserve .desc-type .planSM .plan").text(pResplanM);
				
				let resCPrice = parseInt($(".getPrice .price").text().trim());
				resCPrice = resCPrice.toLocaleString();
				$(".getPrice .price").text(resCPrice);
			}
		});
		
		var cntNum = 1;
		var oriPriceCalc = $("#realPrice").val();
		$("#orisavelPrice").val($("#oriRealPrice").val());
		// ?????????
		$(".resSMList .resSMChk label").on("click", function(){
			if($(".reservRst .date").text() == ""){
				alert("????????? ??????????????????");
				$(this).parent(".resSMChk").removeClass("checked");
			}else if($(".reservRst .time").text() == ""){
				alert("????????? ??????????????????");
				$(this).parent(".resSMChk").removeClass("checked");
			}else{
				if(!$(this).parent("").hasClass("checked")){
					//if( parseInt($("#oriMPrice").val()) >= parseInt($("#realPrice").val())){
						//alert("???????????? ?????? ???????????? ?????? ?????? ?????? ???????????????.");
					//}else{
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
						
					//}
				}else{
					$(this).parent("").removeClass("checked");
					$(".maxSMChk").removeClass("checked");
					$("#resSMP").val("0");
					$("#savePrice").val("0");
					$("#remainPrice").val($("#oriMPrice").val());
					$(".remainSM .charge").text($("#oriMPrice").val());
					$(".resCPrice .price").text($("#oriRealPrice").val());
					$("#realPrice").val($("#oriRealPrice").val());
					$("#orisavelPrice").val($("#oriRealPrice").val());
					$("#resSMP").attr("disabled", true);
	
					let resCPrice = parseInt($(".resCPrice .price").text().trim());
					resCPrice = resCPrice.toLocaleString();
					$(".resCPrice .price").text(resCPrice);
				}
			}
		});
		
		$(".increase").on("click",function(){
			if($(".reservRst .date").text() == ""){
				alert("????????? ??????????????????");
			}else if($(".reservRst .time").text() == ""){
				alert("????????? ??????????????????");
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
				alert("????????? ??????????????????");
			}else if($(".reservRst .time").text() == ""){
				alert("????????? ??????????????????");
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
			
			if(parseInt($(this).val()) <= 5000 && parseInt($(this).val()) <= parseInt($("#oriMPrice").val())){
					
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
				
				// ?????? ?????????
				$("#savePrice").val($(this).val().trim());
				// ?????? ?????????
				$("#remainPrice").val($(".remainSM .charge").text());
		
				// ?????? ?????????
				var remainPrice = parseInt($(".remainSM .charge").text().trim());
				var resSMP = $("#resSMP").val();
				var remainCng = remainPrice - resSMP;
				$("#remainPrice").val(remainCng);
				$(".remainSM .charge").text(remainCng);
				$("#orisavelPrice").val($("#oriRealPrice").val() - $("#savePrice").val());
				
				// ??? ?????? ??????
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
				
			}else if(parseInt($(this).val()) > 5000){
				$(".resSMList p.redTxt").show();
				$("#resSMP").addClass("red");
				
				$(".remainSM .charge").val($("#oriMPrice").val());
				$(this).val("0").focus();
				$("#savePrice").val($("#oriMPrice").val());
				$(".remainSM .charge").text($("#oriMPrice").val());
				
			}else if(parseInt($(this).val()) > parseInt($("#oriMPrice").val())){
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
						//if($("#resSMP").val() < 5000){
							//$("#resSMP").val($("#oriMPrice").val());
							//$("#savePrice").val($("#oriMPrice").val());
						//}else{
							$("#resSMP").val("5000");
							$("#savePrice").val("5000");
						//}
						
						// ?????? ?????????
						var remainPrice = parseInt($(".remainSM .charge").text().trim());
						var resSMP = $("#resSMP").val();
						var remainCng = remainPrice - resSMP;
						$("#remainPrice").val(remainCng);
						$("#orisavelPrice").val($("#oriRealPrice").val() - 5000);
						$(".remainSM .charge").text(remainCng);
						
						// ??? ?????? ??????
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
			var pResplanM = $("#pResplanM").val();
			var ePay = $("#ePay").val();
			ePay = parseInt(ePay) + parseInt(pResplanM);
			var pResHead = $("#pResHead").val();
			var pResPrice = $("#pResPrice").val();
			var pResCPay = $("#pResCPay").val();
			var pResCAccount = $("#pResCAccount").val();
			
			if($("#pResCAccount").val() == ""){
				alert("?????? ????????? ??????????????????.");
				$("#resSel").focus();
			}else{
				$.ajax({
					type: "post",
					url: "/product/listReserveProc.jsp",
					data: {"pResPNo" : pResPNo, "pResUId" : pResUId, "pResDate" : pResDate, "pResTime" : pResTime, "pResUseM" : pResUseM, "pResRemainM" : ePay, "pResHead" : pResHead, "pResPrice" : pResPrice, "pResCPay" : pResCPay, "pResCAccount" : pResCAccount},
					success: function(txt) {
						$(".reserveHidden").html(txt);
						$(".reserveForm").submit();
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
	if ($(".mainslide").length != 0) {
	 var mainSwiper = new Swiper('.mainslide .swiper-container', {
            autoplay: {
                delay: 4000,
                disableOnInteraction: false,
            },
            slidesPerView:"auto",
            speed:1000,
            loop:true,
            loopPreventsSlide: true,
            observer:true,
            observeParents:true,
            allowTouchMove : false,
            onlyExternal: true,
            pagination: {
                el: '.mainslide .swiper-pagination',
                clickable: false,
            },
            on: {
                init: function(){
                },
                slideChangeTransitionStart: function(){
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find(".bg"),0 ,{scale:1, rotate:0.001, ease:Power3.easeOut});
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find("p.sub-tit"),0 ,{top:50, opacity:0, ease:Power3.easeOut});
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find("p.main-tit"),0 ,{delay:0, top:50, opacity:0, ease:Power3.easeOut});
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find("p.info-tit"),0 ,{delay:0, top:50, opacity:0, ease:Power3.easeOut});
                },
                slideChangeTransitionEnd: function(){
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find(".bg"),4 ,{scale:1.1, rotate:0, ease:Power3.easeOut});
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find("p.sub-tit"),2 ,{top:0, opacity:1, ease:Power3.easeOut});
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find("p.main-tit"),2 ,{delay:0.2, top:0, opacity:1, ease:Power3.easeOut});
                    gsap.to($(".mainslide .swiper-container .swiper-slide").eq(this.activeIndex).find("p.info-tit"),2 ,{delay:0.4, top:0, opacity:1, ease:Power3.easeOut});
                },
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
				$(this).html("??????");
				$(this).siblings("div").find("span.percentBar").css({"width": "100%", "background-color": "grey"});
				$(this).css({"background-color": "#ddd"});
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

	if ($(".myReviewStar").length != 0) {
		$(".myReviewStar").each(function(e){
			let star = $(".myReviewStarpoint").eq(e).val();
			let width = star*23;
			$(this).css({"width": width+"px"})
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
		if ($.trim(getText.eq(g).text()) == '????????????') {
			getText.eq(g).addClass("now");
		}
		else if ($.trim(getText.eq(g).text()) == '???????????????') {
			getText.eq(g).addClass("today");
		}
		else if ($.trim(getText.eq(g).text()) == '????????????') {
			getText.eq(g).addClass("coupon");
		}
		else if ($.trim(getText.eq(g).text()) == 'MD??????') {
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

// review file??? ????????????
function fileVal(a)
{
	//$("#fileName").val(a.files[0].name);
	// ????????? ?????? ??????
	//fileName : ?????? ?????? (C:\fakepath\????????????.?????????)
	let pWfile = $(a).val().trim();
	let fileName = pWfile.substring(12);
	$("#fileName").val(fileName);
	
	// extension. ?????????, lastIndexOf : idx ?????? ?????????, dotIdx : ??? ?????? (???????????? 16)
	let dotIdx = pWfile.lastIndexOf(".");
	let ext = pWfile.substring(dotIdx + 1); // ''.?????????'??? +1 ?????? '?????????'
	ext = ext.toLowerCase(); // ???????????? ?????? ???????????? ??????
	
	
	let forbidExt = ["jpg", "png", "gif"]; // ????????? ????????????
	let chk = false;
	
	for (let x of forbidExt) {
		if (x == ext) {
			chk = true;
		}
	}
	
	if (!chk) {
		alert("???????????? " + ext + "??? ????????? ????????? ?????? ??? ????????????.");
		$(a).siblings(".fileBtn").focus();
	} else{
		$(a).siblings(".file-name").css("display", "flex");
		$(a).siblings(".file-name").find("span").text(a.files[0].name);
		//$("#fileName").val(a.files[0].name);
		
		let x = document.getElementById("pWfile");
		//let len = x.files.length; // ???????????? ????????? ??????
		let fileSize = x.files[0].size; // ??????????????? ????????? ????????? ??????

		if (fileSize > 10 * 1024 * 1024) {
			alert("?????? ????????? ????????? 10MB?????????.");
			$(a).val("").clone(true);
			$(a).siblings(".fileBtn").focus();
		}
	}
	
}

// ????????? ?????? ?????? ???
function fileValM(a)
{
	console.log($(a));
	
	//$("#fileName").val(a.files[0].name);
	// ????????? ?????? ??????
	//fileName : ?????? ?????? (C:\fakepath\????????????.?????????)
	var fileData = "#" + $(a).attr("data-target");
	let pWfile = $(a).val().trim();
	let fileName = pWfile.substring(12);
	$(fileData).val(fileName);
	console.log(fileData);
	
	// extension. ?????????, lastIndexOf : idx ?????? ?????????, dotIdx : ??? ?????? (???????????? 16)
	let dotIdx = pWfile.lastIndexOf(".");
	let ext = pWfile.substring(dotIdx + 1); // ''.?????????'??? +1 ?????? '?????????'
	ext = ext.toLowerCase(); // ???????????? ?????? ???????????? ??????
	
	
	let forbidExt = ["jpg", "png", "gif"]; // ????????? ????????????
	let chk = false;
	
	for (let x of forbidExt) {
		if (x == ext) {
			chk = true;
		}
	}
	
	if (!chk) {
		alert("???????????? " + ext + "??? ????????? ????????? ?????? ??? ????????????.");
		$(a).siblings(".fileBtn").focus();
	} else{
		$(a).siblings(".file-name").css("display", "flex");
		$(a).siblings(".file-name").find("span").text(a.files[0].name);
		//$("#fileName").val(a.files[0].name);
		
		let x = document.getElementById("pWfile");
		//let len = x.files.length; // ???????????? ????????? ??????
		let fileSize = x.files[0].size; // ??????????????? ????????? ????????? ??????

		if (fileSize > 10 * 1024 * 1024) {
			alert("?????? ????????? ????????? 10MB?????????.");
			$(a).val("").clone(true);
			$(a).siblings(".fileBtn").focus();
		}
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
	alert("URL??? ?????????????????????.");
}

// popup //
function modalOpen(id) {
	var id = id;

	$("body").addClass("modal-open");
	$(id).addClass("in").show();

	modalDimOpen(id); //dim show
	

	//return false;
	
	// ?????? ?????? ??????
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
