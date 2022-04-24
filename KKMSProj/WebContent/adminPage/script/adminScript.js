
$(function() {

	$(".memberListSearchBtnG").on("click", function() {
		let tag = $("#mSrh-tag option:selected").val();
		let srhTxt = $("#mSrh-txt").val();
		let url = "/adminPage/memberManager/listSearchG.jsp?";
		location.href = url+"tag="+tag+"&srhTxt="+srhTxt;
	});
	
	$(".memberListSearchBtnS").on("click", function() {
		let tag = $("#mSrh-tag option:selected").val();
		let srhTxt = $("#mSrh-txt").val();
		let url = "/adminPage/memberManager/listSearchS.jsp?";
		location.href = url+"tag="+tag+"&srhTxt="+srhTxt;
	});
	
	$(".memberListSearchBtnW").on("click", function() {
		let tag = $("#mSrh-tag option:selected").val();
		let srhTxt = $("#mSrh-txt").val();
		let url = "/adminPage/memberManager/listSearchW.jsp?";
		location.href = url+"tag="+tag+"&srhTxt="+srhTxt;
	});
	
	$("#mSrh-txt").keypress(function(event){
		if(event.which == 13) {
			$(this).next().click();
		}
	});

	if ($(".memberBtn").length != 0) {
		$(".agree").on("click", function() {
			let uId = $(this).parent().siblings(".reqId").text();
			uId = uId.trim();

			const result = confirm("승인처리 하시겠습니까?");
			if (result) {
				$.ajax({
					type: "post",
					url: "/adminPage/memberManager/joinAgree.jsp",
					data: { "uId": uId },
					success: function(txt) {
						alert("가입 승인완료");
						location.reload();
					}
				});
			}

		});

		$(".disagree").on("click", function() {
			let uId = $(this).parent().siblings(".reqId").text();
			uId = uId.trim();

			const result = confirm("승인 거부처리 하시겠습니까?");
			if (result) {
				$.ajax({
					type: "post",
					url: "/adminPage/memberManager/joinDisagree.jsp",
					data: { "uId": uId },
					success: function(txt) {
						alert("가입승인 거부완료");
						location.reload();
					}
				});
			}

		});
	}
	


});