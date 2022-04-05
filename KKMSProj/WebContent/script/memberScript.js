/****** JQuery 영역 시작 ******/

$(function() {

/* 우편번호 찾기 새창 띄우기 */
	$("#zipChk").click(function() {
		window.open("/member/zipChk.jsp", "_blank");
	});
/* 우편번호 찾기 새창 띄우기 */


/****** 약관 동의 영역 *****/
/* 약관 모두 동의 기능 */
	$("#chkAll").click(function() {

		let chkAll = $("#chkAll").is(':checked');
		if (chkAll == true) {
			$(".termsRow input").prop('checked', true);
		} else {
			$(".termsRow input").prop('checked', false);
		}
	});
/* 약관 모두 동의 기능 */


/* 약관 체크 기능 */
	$(".usingTerms input").click(function(){
		let chkService = $("#chkService").is(':checked');
		let chkPrivacy = $("#chkPrivacy").is(':checked');
		let chkAds = $("#termsAds").is(':checked');
		if (chkService && chkPrivacy && chkAds) {
			$("#chkAll").prop('checked', true);
		} else {
			$("#chkAll").prop('checked', false);
		}
	});
/* 약관 체크 기능 */


/* 약관 필수항목 체크 확인 */
	$("#termsBtn").click(function() {
		let chkService = $("#chkService").is(':checked');
		let chkPrivacy = $("#chkPrivacy").is(':checked');

		let reqChk = (chkService && chkPrivacy) ? "on" : "off";


		if (reqChk == "off") {
			alert("필수항목을 체크해주세요");
			$("#chkService").focus();
		} else {
			$("#termsForm").submit();
		}
	});
/* 약관 필수항목 체크 확인 */
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
/* 로그인 유효성 검사 */


/* 로그인 아이디 공백 제거 */
	$("#memberid").keyup(function(){
		let memberid = $("#memberid").val();
		memberid = memberid.trim();
		$("#memberid").val(memberid);
	});
/* 로그인 아이디 공백 제거 */


/* 로그인 패스워드 공백 제거 */
	$("#memberpw").keyup(function(){
		let memberpw = $("#memberpw").val();
		memberpw = memberpw.trim();
		$("#memberpw").val(memberpw);
	});
/* 로그인 패스워드 공백 제거 */
/****** 로그인 영역 *****/


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
					"text-align": "center",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});

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
					"text-align": "center",
					"color": "red",
					"margin-bottom": "10px"
				});
			}
		});
	});
/* 회원탈퇴 비밀번호 유효성 검사 */

/* 회원탈퇴 동의/비동의 버튼 */
/* 동의 */
$("#withdrawAgree").click(function(){
	let wPw = $("#withdrawPw").val();
	location.href="/member/withdrawOK.jsp?wPw="+wPw;
});
/* 동의 */


/* 동의하지 않음 */
$("#withdrawDisagree").click(function(){
	location.href="/member/mypage.jsp";
});
/* 동의하지 않음 */

/* 회원탈퇴 동의/비동의 버튼 */


});

/****** JQuery 영역 끝 ******/




/****** JS 영역 시작 ******/

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

	$.ajax({
		type: "post",
		url: "/member/idChk.jsp",
		data: { "uId": uId },
		success: function(txt) {
			txt = txt.trim();
			if (txt == "Y") {
				$("#idChkMsg").html("사용 가능한 아이디 입니다.");
				$("#uIdChk").val(txt);
				$("#uId").addClass("match");
				$("#uId").removeClass("mismatch");
			} else if (txt == "N") {
				$("#idChkMsg").html("이미 사용중인 아이디 입니다.");
				$("#uIdChk").val(txt);
				$("#uId").addClass("mismatch");
				$("#uId").removeClass("match");
			}
		}
	});
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
	if (uPw == "" || uPwChk == "") {
		$("#uPwChk").removeClass("mismatch");
		$("#uPwChk").removeClass("match");
		$("#pwChkRes").addClass("hidden");
		formName.pwMatch.value = "N";
	} else if (uPw == uPwChk) {
		$("#uPwChk").addClass("match");
		$("#uPwChk").removeClass("mismatch");
		$("#pwChkRes").addClass("hidden");
		formName.pwMatch.value = "Y";
	} else {
		$("#uPwChk").addClass("mismatch");
		$("#uPwChk").removeClass("match");
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
	if (formName.uPw.value == "" || formName.pwMatch.value == "N") {
		alert("비밀번호를 확인해 주세요.");
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
/****** 회원가입 영역 *****/



/****** JS 영역 끝 ******/