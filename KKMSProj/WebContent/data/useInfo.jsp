<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
<link rel="stylesheet" href="/style/style_Common.css">
<link rel="stylesheet" href="/style/style1.css">
<link rel="stylesheet" href="/style/style2.css">
<link rel="stylesheet" href="/style/style3.css">
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/source/gsap.min.js"></script>
<script src="/script/script.js"></script>
<script src="/script/script_bbs.js"></script>
<script src="/script/memberScript.js"></script>
<title>Insert title here</title>
</head>
<body>

	<div id="wrap">
		<%@ include file="/include/header.jsp"%>
		<div class="sub-body">
			<div class="inner">
				<div class="tit-cont">
					<!--  title -->
					<p class="tit">이용안내</p>
				</div>
				<!--div.tit-cont  -->
				<section class="sec4">
					<div class="bInfoBox">
						<p class="tit">티켓 수령안내</p>
						<p class="txt">현장수령</p>

						<ul class="sec-list">
							<li>관람일 당일 예매내역 또는 예매자의 신분증을 제시 후 티켓을 수령하여 입장합니다.</li>
							<li>상품별로 티켓수령방법 및 입장 정책이 상이할 수 있습니다. 상품 상세정보를 확인해주시기 바랍니다.</li>
						</ul>

						<p class="txt">배송</p>

						<ul class="sec-list">
							<li>관람일 당일 예매내역 또는 예매자의 신분증을 제시 후 티켓을 수령하여 입장합니다.</li>
							<li>상품별로 티켓수령방법 및 입장 정책이 상이할 수 있습니다. 상품 상세정보를 확인해주시기 바랍니다.</li>
						</ul>

						<p class="txt">모바일티켓</p>

						<ul class="sec-list">
							<li>관람일 당일 예매내역 또는 예매자의 신분증을 제시 후 티켓을 수령하여 입장합니다.</li>
							<li>상품별로 티켓수령방법 및 입장 정책이 상이할 수 있습니다. 상품 상세정보를 확인해주시기 바랍니다.</li>
						</ul>

						<p class="tit">취소/환불 안내</p>
						<p class="txt">예매취소/변경</p>

						<ul class="sec-list">
							<li>예매취소는 ‘마이페이지>공연티켓 예매확인/취소’에서 직접취소 또는 전화(위메프 고객센터 <a
								href="tel:1661-4764">1661-4764</a>)로 가능합니다.
							</li>
							<li>취소마감시간 이후 또는 관람일 당일 예매하신 건에 대해서는 취소/변경/환불이 불가합니다.
								(취소마감시간은 상품/관람일에 따라 다를 수 있으며 예매 시 확인할 수 있습니다.)</li>
							<li>예매완료 후 관람일, 좌석 등의 변경을 원하실 경우 기존 예매건을 취소 후 재예매하셔야 합니다.</li>
						</ul>

						<p class="tit">취소 수수료</p>

						<table class="bInfo-table">
							<caption>취소 수수료</caption>
							<colgroup>
								<col width=230px />
								<col width=* />
							</colgroup>
							<thead>
								<tr>
									<th scope="col">취소일</th>
									<th scope="col">취소수수료</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<th scope="row">예매 후 7일이내</th>
									<td>없음</td>
								</tr>
								<tr>
									<th scope="row">예매 후 8일 ~ 관람일 10일전</th>
									<td>없음</td>
								</tr>
								<tr>
									<th scope="row">관람일 9일전 ~ 7일전</th>
									<td>없음</td>
								</tr>
								<tr>
									<th scope="row">관람일 6일전 ~ 3일전</th>
									<td>없음</td>
								</tr>
								<tr>
									<th scope="row">관람일 2일전 ~ 1일전</th>
									<td>없음</td>
								</tr>
								<tr></tr>
							</tbody>
						</table>

						<ul class="sec-list">
							<li>예매 당일 밤 12시 이내 취소 시에는 취소수수료가 부과되지 않습니다. (취소마감시간 내에 한함)</li>
							<li>예매수수료는 예매 당일 밤 12시 이내 취소 시 환불 가능하며, 그 이후에는 환불되지 않습니다.</li>
							<li>관람일 당일 취소/변경/환불은 불가합니다.</li>
							<li>단, 관람일 당일 취소가 가능한 일부 상품의 경우 당일 취소 시 티켓금액의 90%가 취소수수료로
								부과됩니다.</li>
							<li>관람일 당일 취소가 가능한 상품인 경우에도 취소마감일시가 지난 경우 취소하실 수 없습니다.</li>
						</ul>
						<p class="txt">미사용티켓 환불 대상 상품</p>

						<ul class="sec-list">
							<li>사용기간 내 사용하지 못한 티켓은 사용기간 종료일로부터 7일 내 위메프 포인트로 적립해드립니다.</li>
							<li>미사용티켓 환불 시 예매수수료를 제외한 금액이 위메프 포인트로 적립됩니다.</li>
							<li>티켓을 배송 받으신 경우 미사용 티켓 환불을 받으실 수 없습니다.</li>
						</ul>
					</div>
				</section>
			</div>
			<!-- div.inner -->
		</div>
		<!-- div.subbody -->
		<%@ include file="/include/footer.jsp"%>

	</div>
	<!-- div#wrap -->
</body>
</html>