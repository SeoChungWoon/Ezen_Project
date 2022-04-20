
$(function(){
		
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
 
 		///////////////////write.jsp 영역 시작/////////////////
 		
 		function cancel(){

		let chk = confirm("글쓰기를 취소하시겠습니까?");
			if(chk){
				location.href="/data/bbsList.jsp";
			}else {
				window.location.reload();
			}
	}
	
		function main(){
			location.href="/index.jsp";
			
		}
		function writeMove(){
			location.href="/data/write.jsp";
		}
 		
 		///////////////////write.jsp 영역 끝/////////////////
	
		///////////////////bbsList.jsp 영역 시작/////////////////
		function list(){
			location.href="/data/bbsList.jsp";
		}
		
		$("a#delKey").on("click",function(){
			let delChk = comfirm("정말 삭제하시겠습니까?");
			if(delChk){
					location.href="delete.jsp";	
			}else{
				window.location.reroad();	
			}
			
		});
		
		///////////////////bbsList.jsp 영역 끝/////////////////
	
	
	
	
	
	