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
<script src="/source/jquery-3.6.0.min.js"></script>
<script src="/script/script.js"></script>
</head>
<body>
	<div id="wrap">
		<%@ include file="/include/header.jsp"%>
		<h1>회원가입</h1>
		<hr id="headHR">
		<form action="/member/joinProc.jsp" id="joinForm" method="post">
		<div id="joinArea">
		
		
		<table>
			<tbody>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">아이디</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinId">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">비밀번호</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="password" name="joinPw">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">비밀번호 확인</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="password" name="joinPwChk">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">이름</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinName">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">성별</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="radio" name="joinGender" value="male">
					<span class="genderTxt">남성</span>
					<input type="radio" name="joinGender" value="female">
					<span class="genderTxt">여성</span>
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">이메일</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinEmail">					
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">생년월일</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" maxlength="8" name="joinBirthDay" placeholder="YYYYMMDD">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">우편번호</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" maxlength="7" name="joinZipcode" placeholder="000-000">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">주소</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinAddr">
					</td>
				</tr>
				<!-- 
 				<tr>
					<td class="joinTitle">
					<span class="joinTitle">우편 번호</span>
					<button><a href="/member/findZipcode.jsp" target="_blank">우편번호 찾기</a></button>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" readonly maxlength="7" name="joinZipcode" placeholder="000-000">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">주소</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" readonly name="joinAddr">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">상세 주소</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinAddr2">
					</td>
				</tr>
				-->
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">취미</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinHobby">
					</td>
				</tr>
				<tr>
					<td class="joinTitle">
					<span class="joinTitle">직업</span>
					</td>
				</tr>
				<tr>
					<td>
					<input type="text" name="joinJob">
					</td>
				</tr>
				<tr>
					<td>
					<button type="submit">가입하기</button>
					<button type="reset">다시쓰기</button>
					</td>
				</tr>
			</tbody>
		</table>
		
		</div>
		<!-- div#joinArea -->
		</form>
		<!-- joinForm -->

		<%@ include file="/include/footer.jsp"%>
	</div>
	<!-- div#wrap -->

</body>
</html>