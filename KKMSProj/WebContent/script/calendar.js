var today = new Date();
var date = new Date();
//사용자가 클릭한 셀 객체 저장
var selectedCell;
//오늘 기준으로 불현하는 월. 일 객체
var realMonth = date.getMonth() + 1;
var realToDay = date.getDate();
//사용자가 클릭한 일자의 월, 일 객체
var selectedMonth = null;
var selectedDate = null;
$(function() {
	buildCalendar();
});

function buildCalendar() {
	var row = null;
	var cnt = 0;
	var calendarTable = document.getElementById("calendar");
	var calendarTableTitle = document.getElementById("dateTxt");
	calendarTableTitle.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";
	let startDate = $(".startDate").text();
	let sYear = startDate.substring(0, 4);
	let sMonth = startDate.substring(5, 7);
	let sDay = startDate.substring(8,10);
	let endDate = $(".endDate").text();
	let eYear = endDate.substring(0, 4);
	let eMonth = endDate.substring(5, 7);
	let eDay = endDate.substring(8,10);
	
	
	var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	//
	nowMonth = today.getMonth() + 1;
	nowYear = today.getFullYear();
	monthEquals = thisMonth(nowMonth, realMonth);
	//
	while (calendarTable.rows.length > 2) {
		calendarTable.deleteRow(calendarTable.rows.length - 1);
	}
	row = calendarTable.insertRow();
	
	row = calendarTable.insertRow();
	for (i = 1; i <= lastDate.getDate(); i++) {
		if(i==1){
			for (j = 0; j < firstDate.getDay(); j++) {
				cell = row.insertCell();
				cnt += 1;
			}			
		}
		// 예약 못하는 제약사항 해당되면 1씩 증가
		noCount = 0;
		//
		cell = row.insertCell();
		cnt += 1;

		cell.setAttribute('id', i);
		cell.innerHTML = i;
		cell.align = "center";

		if (cnt % 7 == 1) {
			cell.innerHTML = "<a href='javascript:'><span class='red'>" + i + "</span></a>";
			$(cell).addClass("off");
		}

		if (cnt % 7 == 0) {
			cell.innerHTML = "<a href='javascript:'><span class='blue'>" + i + "</span></a>";
			row = calendar.insertRow();
		}
		//
		etp = exchangeToPosibleDay(cnt) * 1;
		
		if (eYear-nowYear != 0) {
			if (nowMonth == realMonth && i < realToDay) {
				noCount += 1;
			}
		} else if (sYear-nowYear !=0) {
			if (nowMonth == realMonth && i < realToDay) {
				noCount += 1;
			} else if (nowMonth == eMonth && i>eDay) {
				noCount += 1;
			}
		} else {
			if (nowMonth > eMonth) {
				noCount += 1;
			} else if (nowMonth >= eMonth && i < realToDay && nowMonth == realMonth) {
				noCount += 1;
			} else if ((nowMonth >= sMonth && i < realToDay) && nowMonth < eMonth && nowMonth == realMonth) {
				noCount += 1;
			} else if (nowMonth <= sMonth && (i < sDay || i <= realToDay)) {
				noCount += 1;
			} else if (nowMonth >= eMonth && i > eDay) {
				noCount += 1;
			}
		}
		// 예약 불가
		if (noCount > 0) {
			$(cell).addClass("off");
		// 예약 가능
		} else {
			cell.onclick = function() {
				if($("#rUId").val() != null){
					if(!$(this).hasClass("off")){
						selectedTimeAndTotalPriceInit();
						//선택된 날의 연, 월, 일 계산 (일자의 경우 id속성 참조)
						clickedYear = today.getFullYear();
						clickedMonth = (1 + today.getMonth());
						clickedDate = this.getAttribute('id');
		
						clickedDate = clickedDate >= 10 ? clickedDate : '0' + clickedDate;
						clickedMonth = clickedMonth >= 10 ? clickedMonth : '0' + clickedMonth;
						clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;
						//
						//하단에 예약일시 표시
						// 날짜
						inputField = document.getElementById("selectedDate");
						inputField.value = clickedYMD;
						$(".reservRst .date").text(clickedYMD);
						
						//선택된 월, 일 변수 저장
						selectedMonth = today.getMonth() + 1;
						selectedDate = this.getAttribute('id');
						
						//선택된 셀 색 변화
						$("tr").find("a").removeClass("on");
						$(this).find("a").addClass("on");
						$(".choiceBlock").show();
						$(".choiceBlock .timeChoice a").removeClass("on");
					}
					//
				}else{
					alert("로그인 후 예매가능합니다.");
					location.href="/member/login.jsp";
				}
			}
		}
		cell.innerHTML = "<a href='javascript:'><span>" + i + "</span></a>";

	}
	//
	//
	if (cnt % 7 != 0) {
		for (i = 0; i < 7 - (cnt % 7); i++) {
			cell = row.insertCell();
		}
	}
}


//전달 달력
function prevCalendar() {
	if (today.getMonth() < realMonth) {
		alert("예약은 현재 월부터 2개월 이후까지만 가능합니다.");
		return false;
	}
	today = new Date(today.getFullYear(), today.getMonth() - 1, today.getDate());
	buildCalendar();
}
//다음달 달력
function nextCalendar() {
	if (today.getMonth() + 1 == (realMonth + 2)) {
		alert("예약은 현재 월부터 2개월 이후까지만 가능합니다.");
		return false;
	}
	today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
	buildCalendar();
}
//사용자가 입력한 예약불가능 일자와 대조하기 위해 0~7의 환형 계산구조
function exchangeToPosibleDay(num) {
	result = num % 7;
	result -= 1;
	if (result == -1) {
		result = 6;
	}
	return result;
}
//이번달이면 0 리턴, 다음달이면 1 리턴
function thisMonth(todayMonth, dateMonth) {
	if (todayMonth * 1 == dateMonth * 1) {
		return 0;
	}
	return 1;
}
//날자 클릭시 예약시간 및 결제정보 초기화
function selectedTimeAndTotalPriceInit(){
	// 날짜
	resDateForm = document.getElementById("selectedDate");
	resDateForm.value = "";

	// 시간
	resTimeForm = document.getElementById("selectedTime");
	resTimeForm.value = "";
	$(".reservRst .time").text("");
	
	// 적립금
	useSMPForm = document.getElementById("resSMP");
	useSMPForm.value = "0";
	$("#resSMP").attr("disabled", true);
	$(".remainSM .charge").text($("#oriMPrice").val());
	$("#remainPrice").val($("#oriMPrice").val());
	$("#realPrice").val($("#oriRealPrice").val());		
	$("#orisavelPrice").val($("#oriRealPrice").val());		
	$("#resSMP").val("0");
	$("#savePrice").val("0");
	$("#headCnt").val("1");
	$(".resHeadCnt .cntNum").text("1");
	$(".resCPrice .price").text($("#oriRealPrice").val());
	$(".resSMList .resSMChk").removeClass("checked");
	$(".maxSMChk").removeClass("checked");
	$(".decreseRed").hide();
	$(".increseRed").hide();
	
	let resCPrice = parseInt($(".resCPrice .price").text().trim());
	resCPrice = resCPrice.toLocaleString();
	$(".resCPrice .price").text(resCPrice);
	
}
