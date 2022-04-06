
$(function(){
	////////////////////write.jsp 영역 시작/////////////////
 		$("input#openChk").click(function(){
			$("#contentPw").css({
				"display":"none"
			})
			
	});
		$("input#lockChk").click(function(){
			$("#contentPw").css({
				"display":"block"
			})
		});

		////////////////////write.jsp 영역 끝/////////////////
 });