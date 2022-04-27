

$(function() {
			///////////////////공통영역 시작/////////////////
		$("button.list").on("click",function(){
			let dvChk = $(this).prev().val();
			if(dvChk=="공지사항"){
			location.href="/adminPage/bbsManager/bbsListAd.jsp?divisions="+dvChk;				
			}else{
			location.href="/adminPage/bbsManager/faqListAd.jsp?divisions="+dvChk;
			}
		});
		
		$("button.list-notAd").on("click",function(){
			let dvChk = $(".orgDV").val().trim();
			if(dvChk=="공지사항"){
			location.href="/data/bbsList.jsp?divisions="+dvChk;				
			}else{
			location.href="/data/faqList.jsp?divisions="+dvChk;
			}
		});
		
		///////////////////공통영역 끝/////////////////
		///////////////////faqList.jsp 영역 시작/////////////////

$(".faqBtn").on("click", function(){
	let toggle = $(this).is(":checked");
	if (toggle){
		$(this).parent().parent().next().slideDown(200);
	} else{
		$(this).parent().parent().next().slideUp(200);
	}
});

$(".faqBtn").on("click",function(){
	$(".content").css({
		"border-bottom":"1px solid #555"
		});
});
	
$("button.udBtn").on("click",function(){
	let chkNo = $(this).prev().prev().val().trim();
	let chkDV = $(this).prev().val().trim();
	let chkTitle=$(this).next().next().val().trim();
	let chkCont = $(this).next().next().next().val().trim();
	
	location.href="/adminPage/bbsManager/faqUpdate.jsp?no="+chkNo+"&title="+chkTitle
	+"&content="+chkCont+"&divisions="+chkDV;
});

		///////////////////faqList.jsp 영역 끝/////////////////

 
 		///////////////////write.jsp 영역 시작/////////////////
 		
 		$("#cancel").on("click",function(){

		let chk = confirm("취소하시겠습니까?");
		
			if(chk){
				window.history.back();
			}else {
				window.location.reload();
			}
	});
	
		$(".mainMove").on("click",function(){
			location.href="/index.jsp";
		});
		
		$(".write").on("click",function(){
			let ChkDV = $(this).prev().val();		
			location.href="/adminPage/bbsManager/write.jsp?divisions="+ChkDV;
		});
		
		
		$("#formSave").on("click",function(){
			let title = $(".txtBox").val().trim();
			let content = $(".txtArea").val().trim();
			let form = document.getElementById("writeFrm");
			
			
			if(title==""||content==""){
				alert("제목 또는 내용을 입력해주세요.");
				return false;
			}
			form.action = "/adminPage/bbsManager/writeRes.jsp";
			form.method="POST";
			form.submit();
		});
		
 		///////////////////write.jsp 영역 끝/////////////////

		///////////////////faq-write.jsp 영역 시작/////////////////
		
		$(".faq-write").on("click",function(){
			let ChkDV = $(this).prev().val();
			location.href="/adminPage/bbsManager/faqWrite.jsp?divisions="+ChkDV;
		});
		
		///////////////////faq-write.jsp 영역 끝/////////////////

		
	

		///////////////////noticeView.jsp 영역 시작/////////////////
		
		$("button#delKey").on("click",function(){
			let data = $("#inputNo").val().trim();
			let dvChk=$(".orgDV").val().trim();
			let delChk = confirm("정말 삭제하시겠습니까?");
			if(delChk == true){	
			location.href="/adminPage/bbsManager/delete.jsp?no="+data+"&divisions="+dvChk;
			}else{
				window.location.reroad;
			}
		});

		$("button.faq-del").on("click",function(){
			let noChk = $(this).prev().prev().prev().val().trim();
			let dvChk1 = $(this).prev().prev().val().trim();
			let delChk1 = confirm("정말 삭제하시겠습니까?");
			if(delChk1 == true){
				location.href="/adminPage/bbsManager/delete.jsp?no="+noChk+"&divisions="+dvChk1;
			}else{
				window.location.reroad;	
			}
		
		});
			
		$("button#update").on("click",function(){
			let sendTi = $("#inputTi").val();
			let sendCont = $("#inputCont").val();
			let sendNo = $("#inputNo").val();
			let sendHd = $(this).prev().prev().prev().val();
			
			location.href="/adminPage/bbsManager/update.jsp?no="+sendNo
			+"&title="+sendTi+"&content="+sendCont+"&header="+sendHd;
			
		});
		
		
		
		$("button.adminPg").on("click",function(){
			location.href="/adminPage/bbsManager/bbsListAd.jsp";
		});
		
		$("button.faq_AdminPg").on("click",function(){
			location.href="/adminPage/bbsManager/faqListAd.jsp";
		});

		$("button.adminPg-nv").on("click",function(){
			let nvNo= $("input#nvNo").val();
			let nvDV=$("input#nvDV").val();
			location.href="/adminPage/bbsManager/noticeViewAd.jsp?no="+nvNo+"&divisions="+nvDV;
		});
		
		
		///////////////////noticeView.jsp 영역 끝/////////////////
		///////////////////noData.jsp 영역 시작/////////////////
		
		$(".re-write").on("click",function(){
			location.href="/adminPage/bbsManager/write.jsp";
		});
		
		$(".re-faqWrite").on("click",function(){
			location.href="/adminPage/bbsManager/faqWrite.jsp";
		});
		
		///////////////////noData.jsp 영역 끝/////////////////
		
		//////////////////Update 영역 시작//////////////////

});	
	
	
	
	
	