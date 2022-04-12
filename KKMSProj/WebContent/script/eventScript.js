

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



});