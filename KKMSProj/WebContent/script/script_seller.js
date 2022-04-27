$(function(){
	// 상품 등록
	if ($(".chk-sList").length != 0) {
		$(".flag .chk-sList").each(function(k) {
			
			$(this).find("label").off("click").on("click", function() {
				if (!$(this).parent(".chk-sList").hasClass("checked")) {
					if($(".flag .chk-sList.checked").length < 2){
						$(this).parent(".chk-sList").addClass("checked");
						$(this).siblings("input[type='checkbox']").attr("checked", true);
						var val = $(this).siblings("input[type='checkbox']").val();
						var name = $(this).siblings("input[type='checkbox']").attr("id");
						console.log(name)
						$("input[type=hidden]#"+name).val(val);
					}else{
						alert("최대 2개 선택 가능합니다.");
					}
				} else {
					$(this).parent(".chk-sList").removeClass("checked");
				}
			});
		});
		
		$(".saleChk .chk-sList").each(function(k) {
			$(this).find("label").off("click").on("click", function() {
				if (!$(this).parent(".chk-sList").hasClass("checked")) {
					$(this).parent(".chk-sList").addClass("checked");
					$("#sListSalePercent").attr("disabled", false);
				} else {
					$(this).parent(".chk-sList").removeClass("checked");
					$("#sListSalePercent").attr("disabled", true).val("0");
				}
			});
		});
	}
	
	// radio chk
	if ($(".radio").length != 0) {
        $(".radio").each(function (q) {
            $(this).find(".radio-sList").each(function (k) {
				$(this).find("input[type='radio']").attr("checked", true);
				
                $(this).find("input[type='radio']").off("change").on("change", function () {
                    $(".radio").eq(q).find(".radio-sList").removeClass("rChecked");
                    $(this).parent(".radio-sList").addClass("rChecked");
					$(this).parent(".radio-sList").find("input").attr("checked", true);
                });
            });
        });
	}


	
	// 할인 체크
	if ($(".saleChk").length != 0) {
		$(".saleChk").on("click", function(){
			
		})	;
	};
	
	if($(".sListResigBtn").length != 0){
		$(".sListResigBtn").on("click", function(){
			if($(".flag .chk-sList.checked").length == 0){
				alert("상품 탭을 선택해주세요.");
			}else if($("#sListTitle").val() == ""){
				alert("상품 제목을 작성해주세요.");
				$("#sListName").focus();
			}else if($("#fileName1").val() == "" || $("#fileName2").val() == ""){
				alert("이미지를 등록해주세요.");
			}else if($("#sListInfoTxt").val() == ""){
				alert("내용를 작성해주세요.");
				$("#sListInfoTxt").focus();
			}else if($("#sListContent").val() == ""){
				alert("전시 장소를 작성해주세요.");
				$("#sListContent").focus();
			}else if($("#sListLocation").val() == ""){
				alert("지역 상세를 작성해주세요.");
				$("#sListLocation").focus();
			}else if($("#sListDate1").val() == ""){
				alert("시작 날짜를 작성해주세요.");
				$("#sListDate1").focus();
			}else if($("#sListDate2").val() == ""){
				alert("종료 날짜를 작성해주세요.");
				$("#sListDate2").focus();
			}else if($("#sListOriPrice").val() == ""){
				alert("판매 가격을 작성해주세요.");
				$("#sListOriPrice").focus();
			}else if(parseInt($("#sListOriPrice").val()) < 5000){
				alert("최소 5천원부터 적용가능합니다.");
				$("#sListOriPrice").focus();
			}else{
				$(".sellerListRegisterForm").submit();
			}
			
			
		});
	}
});