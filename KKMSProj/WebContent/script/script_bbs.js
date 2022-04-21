
$(function() {
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

 
 		///////////////////write.jsp 영역 시작/////////////////
 		
 		$("#cannel").on("click",function(){

		let chk = confirm("글쓰기를 취소하시겠습니까?");
			if(chk){
				location.href="/data/bbsListAd.jsp";
			}else {
				window.location.reload();
			}
	});
	
		$(".mainMove").on("click",function(){
			location.href="/index.jsp";
		});
		
		$(".write").on("click",function(){
			location.href="/data/write.jsp";
		});
		
		$("#formSave").on("click",function(){
			let title = $("titleBox").val().trim();
			let content = $("content").val().trim();
			
			if(title.equals("")||content.equals("")){
				alert("제목 또는 내용을 입력해주세요.")
			}
		});
 		
 		///////////////////write.jsp 영역 끝/////////////////
	
		///////////////////bbsList.jsp 영역 시작/////////////////
		$("button.list").on("click",function(){
			let dvChk = $(".orgDV").val().trim();
			if(dvChk=="FAQ"){
				location.href="/data/faqListAd.jsp";
			}else{
				location.href="/data/bbsListAd.jsp";
			}
		});
		
		///////////////////bbsList.jsp 영역 끝/////////////////
		///////////////////noticeView.jsp 영역 시작/////////////////
		
		$("button#delKey").on("click",function(){
			let data = $("#inputNo").val();
			let delChk = confirm("정말 삭제하시겠습니까?");
			if(delChk == true){	
			location.href="/data/delete.jsp?no="+data;
			}else{
				window.location.reroad;
			
			}
		});
		
		$("button#update").on("click",function(){
			let sendTi = $("#inputTi").val();
			let sendCont = $("#inputCont").val();
			let sendNo = $("#inputNo").val();
			
			location.href="/data/update.jsp?no="+sendNo
			+"&title="+sendTi+"&content="+sendCont;
			
		});
		
		$("button.adminPg").on("click",function(){
			location.href="/data/bbsListAd.jsp";
		});
		
		$("button.faq_AdminPg").on("click",function(){
			location.href="/data/faqListAd.jsp";
		});

		$("button.adminPg-nv").on("click",function(){
			let nvNo= $("input#nvNo").val();
			location.href="/data/noticeViewAd.jsp?no="+nvNo;
		});
		///////////////////noticeView.jsp 영역 끝/////////////////
});	
	
	
	
	
	