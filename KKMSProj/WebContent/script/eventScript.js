

$(function() {


/* 이벤트 페이지 태그 버튼 */
	$(".event-tab > li > a").on("click", function() {
		let tag = $(this).next().val();
		$(this).parent().addClass("on");
		$(".event-tab > li > a").not(this).parent().removeClass("on");
		if (tag == "전체") {
			$(".eventRow").show();
		} else {
			$(".eventTag").each(function(i) {
				let txt = $(".eventTag").eq(i).html().trim();
				if (txt == tag) {
					$(".eventRow").eq(i).show();
				} else {
					$(".eventRow").eq(i).hide();
				}
			});
		}
	});
/* 이벤트 페이지 태그 버튼 */


/* 이벤트 기대평 이벤트 */
	$("#eventReplyTxt").on("keyup", function(){
		let txt = $("#eventReplyTxt").val();
		let size = txt.length;
		$("#eventReplySize").html(size+" / 255");
	});
	
	$("#eventReplyBtn").on("click", function(){
		let uId = $("#evId").val();
		let eNo = $("#evNo").val();
		let eTxt = $("#eventReplyTxt").val();
		$.ajax({
			type: "post",
			url: "/event/replyEnter.jsp",
			data: { "uId": uId, "eNo": eNo, "eTxt": eTxt },
			success: function(txt) {
				$(".eventReplyRes").html(txt);
			}
		});
	});
	
	$(".eventReplyDel a").on("click", function(){
		let uId = $("#evId").val();
		let eNo = $("#evNo").val();
		let eTxt = $(this).parent().prev().children().html();
		let eDate = $(this).parent().next().html();
		$.ajax({
			type: "post",
			url: "/event/replyDel.jsp",
			data: { "uId": uId, "eNo": eNo, "eTxt": eTxt, "eDate": eDate },
			success: function(txt) {
				$(".eventReplyRes").html(txt);
			}
		});
	});
/* 이벤트 기대평 이벤트 */


/* 댓글 이동 버튼 */
	$(".reply_btn").on("mouseenter", function(){
		gsap.to($(".enImg "), 0.6, { opacity: 1, top: -5, ease: Power3.easeOut });
		gsap.to($(".reply_btn .enTxt "), 0.4, { opacity: 0, ease: Power3.easeOut });
		gsap.to($(".reply_btn .enTxt "), 0.8, { top:-20, ease: Power3.easeOut });
		
	});
	$(".reply_btn").on("mouseleave", function(){
		gsap.to($(".enImg "), 0.6, { opacity: 0, top: 30, ease: Power3.easeOut });
		gsap.to($(".reply_btn .enTxt "), 0.4, { opacity: 1, ease: Power3.easeOut });
		gsap.to($(".reply_btn .enTxt "), 0.8, { top: 20, ease: Power3.easeOut });
	});
	
	$(".reply_btn").on("click", function(){
		location.href="#eventRefTxt";
	});
	
	$(".guest").on("click", function(){
		alert("로그인 후 이용해주세요.");
		location.href="/member/login.jsp";
	});
/* 댓글 이동 버튼 */

});