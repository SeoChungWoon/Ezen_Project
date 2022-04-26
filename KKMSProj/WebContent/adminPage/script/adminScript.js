
$(function() {
	$(window).on("load", function(){

		//상품관리 상품노출여부 체크
		if($(".proViewOnOff").length != 0) {
			$(".proViewOnOff").each(function(e){
				let viewChk = $(".joinWaitVal").eq(e).val();
				$(".joinWaitSelect option[value="+viewChk+"]").eq(e).prop("selected", true);
			});
		}
	});
	
	$(".proViewOnOffBtn").on("click", function(){
		let data = $(this).prev().val();
		let pNo = $(this).parent().parent().find(".adminPNo").text();
		if(confirm("상품의 노출여부를 "+data+"로 변경합니다.")) {
			$.ajax ({
				type: "post",
				url: "/adminPage/productManager/listProductProc.jsp",
				data: {"data": data, "pNo": pNo},
				success: function(txt) {
					location.reload();
					$(".proViewOnOffRes").html(txt);
				}
			});			
		} else {
		}
	});

	//검색 기능 시작
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
	
	$(".listProductSearch").on("click", function() {
		let tag = $("#mSrh-tag option:selected").val();
		let srhTxt = $("#mSrh-txt").val();
		let url = "/adminPage/productManager/listSearchProduct.jsp?";
		location.href = url+"tag="+tag+"&srhTxt="+srhTxt;
	});
	//검색 기능 끝


	//가입 승인처리
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