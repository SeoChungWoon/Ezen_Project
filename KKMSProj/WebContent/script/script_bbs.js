
		
  //////////faqList 체크박스/////////
  function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName("chkBox");
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  });
}
$(function() {
			///////////////////공통영역 시작/////////////////
		$("button.list").on("click",function(){
			let dvChk = $(".orgDV").val().trim();
			if(dvChk=="공지사항"){
			location.href="/data/bbsListAd.jsp?divisions="+dvChk;				
			}else{
			location.href="/data/faqListAd.jsp?divisions="+dvChk;
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
		$(this).parent().next().slideDown(200);
	} else{
		$(this).parent().next().slideUp(200);
	}
});


$(".faqBtn").on("click", function(){
gsap.fromTo($(".detailIcon"), 1, {rotate: 0},{rotate: 180 });
});

$(".faqBtn").on("click",function(){
	$(".content").css({
		"border-top":"1px solid #ddd"
		});
});
	
$("button#faq-update").on("click",function(){
	let chkNo = $("#hd-no").val().trim();
	let chkTitle=$("#hd-title").val().trim();
	let chkCont = $("#hd-content").val().trim();
	
	location.href="/data/faqUpdate.jsp?no="+chkNo+"&title="+chkTitle+"&content="+chkCont;
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
			let ChkDV = $(this).prev().val();		
			location.href="/data/write.jsp?divisions="+ChkDV;
		});
		

		
	
		
		$("#formSave").on("click",function(){
			let title = $("titleBox").val().trim();
			let content = $("content").val().trim();
			
			if(title.equals("")||content.equals("")){
				alert("제목 또는 내용을 입력해주세요.")
			}
		});
 		
 		///////////////////write.jsp 영역 끝/////////////////

		///////////////////faq-write.jsp 영역 시작/////////////////
		
		$(".faq-write").on("click",function(){
			let ChkDV = $(this).prev().val();
			location.href="/data/faqWrite.jsp?divisions="+ChkDV;
		});
		
		///////////////////faq-write.jsp 영역 끝/////////////////

		
	

		///////////////////noticeView.jsp 영역 시작/////////////////
		
		$("button#delKey").on("click",function(){
			let data = $("#inputNo").val().trim();
			let dvChk=$(".orgDV").val().trim();
			let delChk = confirm("정말 삭제하시겠습니까?");
			if(delChk == true){	
			location.href="/data/delete.jsp?no="+data+"&divisions="+dvChk;
			}else{
				window.location.reroad;
			}
		});

		$("button#faq-delKey").on("click",function(){
			let noChk = $("#hd-no").val().trim();
			let dvChk1 = $("#hd-division").val().trim();
			let delChk1 = confirm("정말 삭제하시겠습니까?");
			if(delChk1 == true){
				location.href="/data/delete.jsp?no="+noChk+"&divisions="+dvChk1;
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
			let nvDV=$("input#nvDV").val();
			location.href="/data/noticeViewAd.jsp?no="+nvNo+"&divisions="+nvDV;
		});
		///////////////////noticeView.jsp 영역 끝/////////////////
		///////////////////noData.jsp 영역 시작/////////////////
		
		$(".re-write").on("click",function(){
			location.href="/data/write.jsp";
		});
		
		$(".re-faqWrite").on("click",function(){
			location.href="/data/faqWrite.jsp";
		});
		
		///////////////////noData.jsp 영역 끝/////////////////
		
		
});	
	
	
	
	
	