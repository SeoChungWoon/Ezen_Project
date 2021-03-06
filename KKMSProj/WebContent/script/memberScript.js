/****** JQuery 영역 시작 ******/

$(function() {

/* 회원 종류 선택 */

	if($(".choiceJoin").length != 0){
		$(".choiceJoin a").on("mouseenter", function(){
			gsap.to($(this), 0.4, { top : -15, opacity : 1, ease: Power3.easeOut });
		});
		$(".choiceJoin a").on("mouseleave", function(){
			gsap.to($(this), 0.4, { top : 0, opacity : 0.75, ease: Power3.easeOut });
		});
	}

/* 회원 종류 선택 */


/* 우편번호 찾기 새창 띄우기 */
	$("#zipChk").click(function() {
		window.open("/member/zipChk.jsp","E-Ticket: 우편번호 찾기","width=700, height=700, left=600, _blank");
	});
/* 우편번호 찾기 새창 띄우기 */


/****** 약관 동의 영역 *****/
/* 약관 모두 동의 기능 */
	$("#chkAll").click(function() {

		let chkAll = $("#chkAll").is(":checked");
		if (chkAll == true) {
			$(".termsRow input").prop("checked", true);
			$(".termsRow label").attr("class", "checked");
		} else {
			$(".termsRow input").prop("checked", false);
			$(".termsRow label").attr("class", "unchecked");
		}
	});
/* 약관 모두 동의 기능 */

/* 약관 체크 기능 */
	$(".usingTerms input").click(function(){
		let thisChk = $(this).is(":checked");
		if (thisChk == true) {
			$(this).next().attr("class", "checked");
		} else {
			$(this).next().attr("class", "unchecked");
		}
		let chkService = $("#chkService").is(":checked");
		let chkPrivacy = $("#chkPrivacy").is(":checked");
		let chkAds = $("#termsAds").is(":checked");
		if (chkService && chkPrivacy && chkAds) {
			$("#chkAll").prop("checked", true);
			$("#chkAll").next().attr("class", "checked");
		} else {
			$("#chkAll").prop("checked", false);
			$("#chkAll").next().attr("class", "unchecked");
		}
	});
/* 약관 체크 기능 */


/* 약관 필수항목 체크 확인 */
	$("#termsBtn").click(function() {
		let chkService = $("#chkService").is(":checked");
		let chkPrivacy = $("#chkPrivacy").is(":checked");
		let reqChk = (chkService && chkPrivacy) ? "on" : "off";


		if (reqChk == "off") {
			alert("필수항목을 체크해주세요");
			$("#chkService").focus();
		} else if (reqChk == "on") {
			$("#termsForm").submit();
		}
	});
/* 약관 필수항목 체크 확인 */


/* 약관 페이지 취소 버튼 */
	$("#termsReset").on("click", function(){
		location.href="/index.jsp";
	});
/* 약관 페이지 취소 버튼 */

/****** 약관 동의 영역 *****/


/****** 로그인 영역 *****/
/* 로그인 유효성 검사 */
	$("#loginBtn").click(function(){
		let memberid = $("#memberid").val();
		let memberpw = $("#memberpw").val();
		$.ajax({
			type: "post",
			url: "/member/loginProc.jsp",
			data: { "memberid": memberid, "memberpw": memberpw },
			success: function(txt) {
				$("#loginErrMsg").html(txt);
				$("#loginErrMsg").css({
					"text-align": "center",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});

	});
	$(".otherLoginBtn").on("click", function(){
		alert("준비중입니다.");
	});
/* 로그인 유효성 검사 */


/* 관리자 로그인 유효성 검사 */
	$("#adminLoginBtn").click(function(){
		let memberid = $("#memberid").val();
		let memberpw = $("#memberpw").val();
		$.ajax({
			type: "post",
			url: "/adminPage/adminLoginProc.jsp",
			data: { "memberid": memberid, "memberpw": memberpw },
			success: function(txt) {
				$("#loginErrMsg").html(txt);
				$("#loginErrMsg").css({
					"text-align": "center",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});

	});
/* 관리자 로그인 유효성 검사 */


/* 로그인 아이디 공백 제거 */
	$("#memberid").keyup(function(){
		let memberid = $("#memberid").val();
		memberid = memberid.trim();
		$("#memberid").val(memberid);
	});
	$("#memberid").keypress(function(event){
		if(event.which == 13) {
			$("#loginBtn").click();
			$("#adminLoginBtn").click();
		}
	});
/* 로그인 아이디 공백 제거 */


/* 로그인 패스워드 공백 제거 */
	$("#memberpw").keyup(function(){
		let memberpw = $("#memberpw").val();
		memberpw = memberpw.trim();
		$("#memberpw").val(memberpw);
	});
	$("#memberpw").keypress(function(event){
		if(event.which == 13) {
			$("#loginBtn").click();
			$("#adminLoginBtn").click();
		}
	});
/* 로그인 패스워드 공백 제거 */
/****** 로그인 영역 *****/


/****** 아이디 / 비밀번호 찾기 영역 *****/
/* 아이디 / 비밀번호 찾기 방식 토글 버튼 */
	$(".fToggle").on("click", function(){
		let toggle = $(this).is(":checked");
		if (toggle) {
			$(".fToggle").not(this).prop("checked", false);
			$(".fToggle").not(this).siblings().find("img").css({"transform" : "rotate(0deg)"});
			$(".fToggle").not(this).parent().next().slideUp(200);
			$(this).parent().next().slideDown(200);
			$(".findValArea input").val("");
			$(this).siblings().find("img").css({"transform" : "rotate(180deg)"});
		} else {
			$(this).parent().next().slideUp(200);
			$(this).parent().next().children().val("");
			$(this).siblings().find("img").css({"transform" : "rotate(0deg)"});
		}
	});
/* 아이디 / 비밀번호 찾기 방식 토글 버튼 */


/* 입력사항 체크 */
	$(".idFindBtnArea button").on("click", function(){
		let data1 = $(this).parent().prev().prev().val();
		let data2 = $(this).parent().prev().val();
		if(data1=="") {
			$(this).parent().prev().prev().focus();
			return;
		}
		if(data2=="") {
			$(this).parent().prev().focus();
			return;
		}
		$("#idFindForm").submit();
	});
	
	$(".pwFindBtnArea button").on("click", function(){
		let data1 = $(this).parent().prev().prev().prev().val();
		let data2 = $(this).parent().prev().prev().val();
		let data3 = $(this).parent().prev().val();
		if(data1=="") {
			$(this).parent().prev().prev().prev().focus();
			return;
		}
		if(data2=="") {
			$(this).parent().prev().prev().focus();
			return;
		}
		if(data3=="") {
			$(this).parent().prev().focus();
			return;
		}
		$("#pwFindForm").submit();
	});
/* 입력사항 체크 */


/****** 비밀번호 재설정 ******/
/* 비밀번호 유효성 검사 */
	$(".findResVal input").on("keyup", function(){
		let fPw = $("#fPw").val();
		let fPwChk = $("#fPwChk").val();
		fPw = fPw.trim();
		fPwChk = fPwChk.trim();
		$("#fPw").val(fPw);
		$("#fPwChk").val(fPwChk);
		
		if (fPwChk == "") {
		$(".findPw").removeClass("mismatch");
		$(".findPw").removeClass("match");
		$("#pwChkRes").addClass("hidden");
		$("#pwMatch").val("N");
		} else if (fPw == fPwChk) {
		$(".findPw").addClass("match");
		$(".findPw").removeClass("mismatch");
		$("#pwChkRes").addClass("hidden");
		$("#pwMatch").val("Y");
		} else {
		$(".findPw").addClass("mismatch");
		$(".findPw").removeClass("match");
		$("#pwChkRes").removeClass("hidden");
		$("#pwMatch").val("N");
		}
	});
/* 비밀번호 유효성 검사 */


/* 비밀번호 재설정 버튼 */
	$("#fPwSubmit").on("click", function(){
		if($("#fPw").length<8 || $("#fPw").length>16) {
			alert("비밀번호는 8~16자로 설정해주세요.");
			return;
		}
		if($("#pwMatch").val()=="Y"){
			$("#fPwForm").submit();
		} else {
			$("#fPw").focus();
			return;
		}
	});

/* 비밀번호 재설정 버튼 */
/****** 비밀번호 재설정 ******/


/* 아이디 / 비밀번호 찾기 input창 유효성 검사 */
	$(".idFindIdPwArea input").keyup(function(){
		let data = $(this).val();
		data = data.trim();
		$(this).val(data);
	});
/* 아이디 / 비밀번호 찾기 input창 유효성 검사 */
/****** 아이디 / 비밀번호 찾기 영역 *****/


/****** 마이페이지 영역 *****/

/* 회원정보 수정 비밀번호 유효성 검사 */
	$("#modifyPwBtn").click(function(){
		let modifyPw = $("#modifyPw").val();
		$.ajax({
			type: "post",
			url: "/member/modifyChk.jsp",
			data: { "modifyPw": modifyPw },
			success: function(txt) {
				$("#modifyErrMsg").html(txt);
				$("#modifyErrMsg *").css({
					"text-align": "left",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});

	});
	$("#sellerModifyPwBtn").click(function(){
		let modifyPw = $("#modifyPw").val();
		$.ajax({
			type: "post",
			url: "/sellerPage/sellerModifyChk.jsp",
			data: { "modifyPw": modifyPw },
			success: function(txt) {
				$("#modifyErrMsg").html(txt);
				$("#modifyErrMsg *").css({
					"text-align": "left",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});

	});
	$("#modifyPw").keypress(function(event){
		if(event.which == 13) {
			$("#modifyPwBtn").click();
			$("#sellerModifyPwBtn").click();
		}
	});
/* 회원정보 수정 비밀번호 유효성 검사 */


/* 회원탈퇴 비밀번호 유효성 검사 */
	$("#withdrawPwBtn").click(function(){
		let withdrawPw = $("#withdrawPw").val();
		$.ajax({
			type: "post",
			url: "/member/withdrawChk.jsp",
			data: { "withdrawPw": withdrawPw },
			success: function(txt) {
				$("#withdrawErrMsg").html(txt);
				$("#withdrawErrMsg *").css({
					"text-align": "left",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});
	});
	$("#sellerWithdrawPwBtn").click(function(){
		let withdrawPw = $("#withdrawPw").val();
		$.ajax({
			type: "post",
			url: "/sellerPage/sellerWithdrawChk.jsp",
			data: { "withdrawPw": withdrawPw },
			success: function(txt) {
				$("#withdrawErrMsg").html(txt);
				$("#withdrawErrMsg *").css({
					"text-align": "left",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});
	});
	$("#withdrawPw").keypress(function(event){
		if(event.which == 13) {
			$("#withdrawPwBtn").click();
			$("#sellerWithdrawPwBtn").click();
		}
	});
/* 회원탈퇴 비밀번호 유효성 검사 */


/* 회원탈퇴 동의, 비동의 버튼 */
/* 동의 */
$("#withdrawAgree").on("click", function(){
	let wPw = $("#withdrawPw").val();
	const result = confirm("정말 탈퇴 하시겠습니까?");
		if(result) {
			location.href="/member/withdrawOK.jsp?wPw="+wPw;
		}
});
/* 동의 */


/* 동의하지 않음 */
$("#withdrawDisagree").click(function(){
	location.href="/member/mypage.jsp";
});
/* 동의하지 않음 */
/* 회원탈퇴 동의, 비동의 버튼 */


/* 마이페이지 정보 수정 버튼 */
$(".modifyBtn").on("click", function(){
	$(this).parent().siblings(".modifyVal").children("input[type=text]").attr("readonly", false);
	$(this).parent().siblings(".modifyVal").children("input[type=text]").removeClass("readonlyInput");
	$(this).parent().siblings(".modifyVal").children("input[type=text]").focus();
});
/* 마이페이지 정보 수정 버튼 */


/* 마이페이지 주소 수정 버튼 */
$(".modifyAddrBtn").on("click", function(){
	$("#changeAddr").removeClass("hidden");
	$(".modifyAddrArea"). addClass("hidden");
	$("#uZipcode").val(null);
	$("#uAddr").val(null);
});
/* 마이페이지 주소 수정 버튼 */


/* 마이페이지 리셋 버튼 */
$("#modifyResetBtn").on("click", function(){
	$("#changeAddr").addClass("hidden");
	$(".modifyAddrArea").removeClass("hidden");
	$("#nEmail").addClass("readonlyInput");
	$("#nEmail").prop("readonly", true);
	$("#uPhone").addClass("readonlyInput");
	$("#uPhone").prop("readonly", true);
});
/* 마이페이지 리셋 버튼 */

/* 적립금 천단위 구분 기호 */
$(document).ready(function(){
    
	if($(".mypageRow").length != 0) {
		let ePay = $(".myEpay").text();
		ePay = ePay.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
		ePay += " 원";
		$(".myEpay").text(ePay);
	}
	
	if($(".myReservePrice").length != 0) {
		$(".myReservePrice").each(function(e){
			let data = $(".reservePrice").eq(e).text();
			data = data.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			data += " 원";
			$(".reservePrice").eq(e).text(data);			
		});
	}
	  
});
/* 적립금 천단위 구분 기호 */


/* 내가 쓴 리뷰 새창 띄우기 */
$("#myReviewBtn").click(function() {
		window.open("/member/myReview.jsp", "E-Ticket :내가 쓴 리뷰", "width=700, height=700, left=600, _blank");
	});
	
$(".mypagePopClose button").on("click", function(){
	self.close();
});
/* 내가 쓴 리뷰 새창 띄우기 */



/****** 마이페이지 영역 *****/


/* 성별 라디오박스 체크/언체크 */
$("#genderArea input").click(function(){
		let male = $("#male").is(':checked');
		let female = $("#female").is(':checked');
		if(male==true) {
			$("#male").next().attr("class", "genderChecked");
			$("#female").next().attr("class", "genderUnchecked");	
		}
		if(female==true) {
			$("#female").next().attr("class", "genderChecked");
			$("#male").next().attr("class", "genderUnchecked");
		}
	});
/* 성별 라디오박스 체크/언체크 */



});

/****** JQuery 영역 끝 ******/




/****** JS 영역 시작 ******/

/* 마이페이지 수정사항 저장 버튼*/
function modifyConfirm(formName) {
	if (formName.uPw.value != formName.uPwChk.value) {
		alert("비밀번호를 확인해 주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uPw.value.length != 0 && (formName.uPw.value.length < 8 || formName.uPw.value.length > 16)) {
		alert("비밀번호는 8~16자 사이로 설정해주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uPw.value == formName.mPw.value) {
		alert("기존과 동일한 비밀번호는 사용하실 수 없습니다.");
		formName.uPw.focus();
		return;
	}
	if (formName.nEmail.value == "") {
		alert("이메일 주소를 입력해 주세요.");
		formName.nEmail.focus();
		return;
	}
	if (formName.uZipcode.value == "") {
		alert("주소를 확인해 주세요.");
		formName.addr2.focus();
		return;
	}	
	uPhone = formName.uPhone.value;
	if (uPhone == "" || uPhone.length < 11) {
		alert("휴대폰 번호를 확인해 주세요.");
		formName.uPhone.focus();
		return;
	}
	
	formName.submit();
}
function sellerModifyConfirm(formName) {
	if (formName.uPw.value != formName.uPwChk.value) {
		alert("비밀번호를 확인해 주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uPw.value.length != 0 && (formName.uPw.value.length < 8 || formName.uPw.value.length > 16)) {
		alert("비밀번호는 8~16자 사이로 설정해주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uPw.value == formName.mPw.value) {
		alert("기존과 동일한 비밀번호는 사용하실 수 없습니다.");
		formName.uPw.focus();
		return;
	}
	if (formName.nEmail.value == "") {
		alert("이메일 주소를 입력해 주세요.");
		formName.nEmail.focus();
		return;
	}	
	uPhone = formName.uPhone.value;
	if (uPhone == "" || uPhone.length < 11) {
		alert("휴대폰 번호를 확인해 주세요.");
		formName.uPhone.focus();
		return;
	}
	
	formName.submit();
}
/* 마이페이지 수정사항 저장 버튼*/


/****** 회원가입 영역 *****/
/* 아이디 유효성 검사 */
function idChk(formName) {

	let uId = formName.uId.value;
	let regexp = /[^A-Za-z0-9]/g;
	uId = uId.trim();
	formName.uId.value = uId;
	if (regexp.test(uId)) {
		$("#uId").val($("#uId").val().replace(regexp, ""));
		alert("영문자와 숫자만 입력할 수 있습니다.");
	}
	if (uId != "") {
		$("#idChkRes").removeClass("hidden");
	} else {
		$("#idChkRes").addClass("hidden");
	}
	let uIdL = uId.length;
	if ( uIdL > 4 ) {
	$.ajax({
		type: "post",
		url: "/member/idChk.jsp",
		data: { "uId": uId },
		success: function(txt) {
			txt = txt.trim();
			if (txt == "Y") {
				$("#idChkMsg").html("* 사용 가능한 아이디 입니다.");
				$("#idChkMsg").css({"color": "#0086b8"});
				$("#uIdChk").val(txt);
				$("#uId").addClass("match");
				$("#uId").removeClass("mismatch");
			} else if (txt == "N") {
				$("#idChkMsg").html("* 이미 사용중인 아이디 입니다.");
				$("#idChkMsg").css({"color": "#e64949"});
				$("#uIdChk").val(txt);
				$("#uId").addClass("mismatch");
				$("#uId").removeClass("match");
			} 
		}
	});
	} else {
		$("#idChkMsg").html("* 5자 이상의 아이디를 입력해주세요.");
		$("#idChkMsg").css({"color": "#000"});
		$("#uIdChk").val("N");
		$("#uId").removeClass("mismatch");
		$("#uId").removeClass("match");
	}
}
/* 아이디 유효성 검사 */


/* 비밀번호 유효성 검사 */
function pwChk(formName) {
	let uPw = formName.uPw.value;
	let uPwChk = formName.uPwChk.value;
	uPw = uPw.trim();
	uPwChk = uPwChk.trim();
	formName.uPw.value = uPw;
	formName.uPwChk.value = uPwChk;
	if (uPwChk == "") {
		$(".joinPw").removeClass("mismatch");
		$(".joinPw").removeClass("match");
		$("#pwChkRes").addClass("hidden");
		formName.pwMatch.value = "N";
	} else if (uPw == uPwChk) {
		$(".joinPw").addClass("match");
		$(".joinPw").removeClass("mismatch");
		$("#pwChkRes").addClass("hidden");
		formName.pwMatch.value = "Y";
	} else {
		$(".joinPw").addClass("mismatch");
		$(".joinPw").removeClass("match");
		$("#pwChkRes").removeClass("hidden");
		formName.pwMatch.value = "N";
	}

}
/* 비밀번호 유효성 검사 */


/* 이름 유효성 검사 */
function nameChk(formName) {
	let uName = formName.uName.value;
	uName = uName.trim();
	formName.uName.value = uName;
	let regexp = /[0-9]/g;
	if (regexp.test(uName)) {
		$("#uName").val($("#uName").val().replace(regexp, ""));
		alert("숫자는 입력할 수 없습니다.");
	}
}
/* 이름 유효성 검사 */


/* 생년월일 유효성 검사 */
function birthChk(formName) {
	let uBirthday = formName.uBirthday.value;
	uBirthday = uBirthday.trim();
	formName.uBirthday.value = uBirthday;
	let regexp = /[^0-9]/g;
	if (regexp.test(uBirthday)) {
		$("#uBirthday").val($("#uBirthday").val().replace(regexp, ""));
		alert("숫자만 입력할 수 있습니다.");
	}
}
/* 생년월일 유효성 검사 */


/* 우편번호 검색 */
function dongChk() {
	frm = document.zipFrm;
	if (frm.area3.value == "") {
		alert("동 이름을 입력해주세요.");
		frm.area3.focus();
		return;
	}
	frm.action = "/member/zipChk.jsp";
	frm.submit();
}
/* 우편번호 검색 */


/* 우편번호 결과 선택 및 적용 */
function sendAdd(zipcode, area1, area2, area3, area4) {
	zip = zipcode;
	add = area1 + " " + area2 + " " + area3 + " " + area4;
	opener.document.getElementById("uZipcode").value = zip;
	opener.document.getElementById("addr1").value = add;
	self.close();
}
/* 우편번호 결과 선택 및 적용 */


/* 주소 합치기 */
function addr(formName) {
	let addr1 = formName.addr1.value;
	let addr2 = formName.addr2.value;
	let uAddr = addr1 + addr2;
	formName.uAddr.value = uAddr;
}
/* 주소 합치기 */


/* 휴대폰 번호 유효성 검사 */
function pNum(formName) {
	let pNum = formName.uPhone.value;
	let regexp = /[^0-9]/g;
	pNum = pNum.trim();
	formName.uPhone.value = pNum;
	if (regexp.test(pNum)) {
		$("#uPhone").val($("#uPhone").val().replace(regexp, ""));
		alert("숫자만 입력할 수 있습니다.");
	}
}
/* 휴대폰 번호 유효성 검사 */


/* 입력 정보 확인 및 회원가입 */
function join(formName) {
	if (formName.uId.value =="") {
		alert("아이디를 입력해 주세요.");
		formName.uId.focus();
		return;
	}
	if (formName.uIdChk.value  =="N") {
		alert("이미 사용중인 아이디입니다.");
		formName.uId.focus();
		return;
	}
	if (formName.uPw.value == "" || formName.uPwChk.value == "" || formName.pwMatch.value == "N") {
		alert("비밀번호를 확인해 주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uPw.value.length<8 || formName.uPw.value.length>16) {
		alert("비밀번호는 8~16자 사이로 설정해주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uName.value == "") {
		alert("이름을 입력해 주세요.");
		formName.uName.focus();
		return;
	}
	uBirth = formName.uBirthday.value;
	if (uBirth == "" || uBirth.length < 8) {
		alert("생년월일을 확인해 주세요.");
		formName.uBirthday.focus();
		return;
	}
	if (formName.uGender.value == "") {
		alert("성별을 선택해 주세요.");
		formName.uGender.focus();
		return;
	}
	if (formName.uEmail.value == "") {
		alert("이메일 주소를 입력해 주세요.");
		formName.uEmail.focus();
		return;
	}
	if (formName.uZipcode.value == "" || formName.addr2.value == "") {
		alert("주소를 확인해 주세요.");
		formName.addr2.focus();
		return;
	}	
	uPhone = formName.uPhone.value;
	if (uPhone == "" || uPhone.length < 11) {
		alert("휴대폰 번호를 확인해 주세요.");
		formName.uPhone.focus();
		return;
	}
	let ads = formName.TermsAds.value;
	if (ads == "Y") {
		formName.TermsAds.value = "Y";
	} else if (ads == "N") {
		formName.TermsAds.value = "N";
	}
	
	formName.submit();
}
/* 입력 정보 확인 및 회원가입 */

/* 판매자 회원가입 */
function sellerJoin(formName) {
	if (formName.uId.value =="") {
		alert("아이디를 입력해 주세요.");
		formName.uId.focus();
		return;
	}
	if (formName.uIdChk.value  =="N") {
		alert("이미 사용중인 아이디입니다.");
		formName.uId.focus();
		return;
	}
	if (formName.uPw.value == "" || formName.uPwChk.value == "" || formName.pwMatch.value == "N") {
		alert("비밀번호를 확인해 주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uPw.value.length<8 || formName.uPw.value.length>16) {
		alert("비밀번호는 8~16자 사이로 설정해주세요.");
		formName.uPw.focus();
		return;
	}
	if (formName.uName.value == "") {
		alert("이름을 입력해 주세요.");
		formName.uName.focus();
		return;
	}
	uBirth = formName.uBirthday.value;
	if (uBirth == "" || uBirth.length < 8) {
		alert("생년월일을 확인해 주세요.");
		formName.uBirthday.focus();
		return;
	}
	if (formName.uGender.value == "") {
		alert("성별을 선택해 주세요.");
		formName.uGender.focus();
		return;
	}
	if (formName.uEmail.value == "") {
		alert("이메일 주소를 입력해 주세요.");
		formName.uEmail.focus();
		return;
	}
	uPhone = formName.uPhone.value;
	if (uPhone == "" || uPhone.length < 11) {
		alert("휴대폰 번호를 확인해 주세요.");
		formName.uPhone.focus();
		return;
	}
	let ads = formName.TermsAds.value;
	if (ads == "Y") {
		formName.TermsAds.value = "Y";
	} else if (ads == "N") {
		formName.TermsAds.value = "N";
	}
	
	formName.submit();
}
/* 판매자 회원가입 */
/****** 회원가입 영역 *****/



/****** JS 영역 끝 ******/