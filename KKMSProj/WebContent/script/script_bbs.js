
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
		
		///////////////////faqList.jsp 영역 시작/////////////////

$(".faqBtn").on("click", function(){
	let toggle = $(this).is(":checked");
	if (toggle){
		$(this).parent().parent().next().slideDown(200);
	} else{
		$(this).parent().parent().next().slideUp(200);
	}
});

 var angle = 1;

    $("faqBtn").on("click",function(angle) {
        setInterval(function(angle) {
                $("#pic").rotate(angle);
                /* angle += 1; Increases the rotating speed */
        }, 100);
    });

	


		///////////////////faqList.jsp 영역 끝/////////////////
 });