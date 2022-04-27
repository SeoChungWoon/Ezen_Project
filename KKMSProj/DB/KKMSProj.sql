## KKMSProj DB ##

create database KKMSProj;

use KKMSProj;

create table member (
no int auto_increment,
uId char(15) not null,
uPw char(16) not null,
uName char(20) not null,
uBirthday char(8),
uGender char(6),
uEmail char(50) not null,
uPhone char(11) not null,
uZipcode char(7),
uAddr varchar(200),
termsAds char(1),
mType char(5) not null,
joinWait char(2),
ePay int,
joinDate date not null,
constraint primary key(uId),
constraint unique key(no)
);

alter table member add column ePay int;
alter table member add column joinDate date;
alter table member drop column ePay;

alter table proList modify pLocation varchar(100);

insert into member values (200, 'admin', 'admin', '관리자', '00000000', 'null', 'null', '01012345678', 'null', 'null', '', '관리자', '');
select count(*) from member where uId = 'a';

insert into member (uId, uPw, uName, uEmail, uPhone, mType, joinWait, joinDate) values ('seller1', '1234', '테스트', 'hera6223@naver.com', '01077045339', '판매자', 'N', date_format(now(), '%Y-%m-%d'));
insert into member (uId, uPw, uName, uEmail, uPhone, mType, joinWait, joinDate) values ('seller2', '1234', '테스트', 'hera6223@naver.com', '01077045339', '판매자', 'N', date_format(now(), '%Y-%m-%d'));
insert into member (uId, uPw, uName, uEmail, uPhone, mType, joinWait, joinDate) values ('seller3', '1234', '테스트', 'hera6223@naver.com', '01077045339', '판매자', 'N', date_format(now(), '%Y-%m-%d'));
insert into member (uId, uPw, uName, uEmail, uPhone, mType, joinWait, joinDate) values ('seller4', '1234', '테스트', 'hera6223@naver.com', '01077045339', '판매자', 'N', date_format(now(), '%Y-%m-%d'));
insert into member (uId, uPw, uName, uEmail, uPhone, mType, joinWait, joinDate) values ('seller5', '1234', '테스트', 'hera6223@naver.com', '01077045339', '판매자', 'N', date_format(now(), '%Y-%m-%d'));
insert into member (uId, uPw, uName, uEmail, uPhone, mType, joinWait, joinDate) values ('seller6', '1234', '테스트', 'hera6223@naver.com', '01077045339', '판매자', 'N', date_format(now(), '%Y-%m-%d'));

select * from member;

drop table member;

select count(*) from member where joinWait='N';






create table tblZipcode (
zipcode char(7),
area1 char(10),
area2 char(20),
area3 char(40),
area4 char(20)
);



/*게시판용 테이블 시작*/
create table bbsList (
no		int	auto_increment	not null,
divisions	char(20)	not null,
header	char(20),
title		char(50)	not null,
wName	char(20),				/*wName = writerName*/
content varchar(1000)	not null,
fileName  char(100),
postDate	date,
count	int,
constraint primary key (no)
);

desc bbsList;

insert into bbsList (divisions, header, title, wName, content, postDate) values
('공지사항', '[안내]', '빛：영국 테이트미술관 특별전 티켓오픈 안내','관리자',
'안녕하세요. E-TICKET입니다.

빛：영국 테이트미술관 특별전 티켓오픈 안내입니다.

상품소개

전시기간: 2021.12.21 ~2022.05.08

전시장소: 서울시립 북서울미술관
 
영국 테이트미술관이 선정한 미술사 최고의 예술가 43인의 특별전. 보는 전시가 아닌, 당신이 곧 작품이 되는 전시',
date_format('2021-11-11', '%Y-%m-%d'));

insert into bbsList (divisions, header, title, wName, content, postDate) values
('공지사항', '[안내]', '차지연 & 마이클 리 with 루체오케스트라 - 경주​​ 티켓오픈 안내','관리자',
'안녕하세요, E-TICKET입니다.

차지연 & 마이클 리 with 루체오케스트라 - 경주​​ 티켓오픈 안내입니다.​


공연정보
공연 기간 : 2022년 03월 31일(목)

공연 시간 : 20시

공연 장소 : 경주예술의전당 화랑홀

티켓 가격 : R석 5만원, S석 4만원, 시야제한석 2만원

관람 시간 : 90분

관람 등급 : 초등학생 이상 관람 가능

공연내용
뮤지컬 배우 차지연, 마이클리와 루체오케스트라가 함께하는 뮤지컬과 클래식의 만남 ',
date_format('2022-02-27', '%Y-%m-%d'));

insert into bbsList (divisions, header, title, wName, content, postDate) values
('공지사항','[이벤트]', '크리스마스 예매 이벤트','관리자',
'안녕하세요. E-TICKET 입니다.

크리스마스 예매 이벤트를 실시 합니다.

이벤트 기간내에 전시회 예매 시 추첨을 통해 다양한 경품을 드립니다.


행사기간 : 2021. 12. 20 ~ 12. 30


※참고해주세요

본 이벤트는 ID 1개당 1회 참여만 가능합니다.
중복으로 참여하시더라도 당첨 확률에는 영향을 미치지 않습니다.
본 이벤트는 예고없이 사전에 종료될 수 있습니다.
본 이벤트는 부적절한 행위 확인 시 당첨이 취소될 수 있습니다.
기타 이벤트 관련 문의사항은 1:1문의 게시판을 이용해주세요.',
date_format('2021-12-10', '%Y-%m-%d'));

insert into bbsList (divisions, header, title, wName, content, postDate) values
('공지사항','[안내]','앤서니 브라운의 원더랜드 뮤지엄展 티켓오픈 안내','관리자',
'안녕하세요. E-TICKET입니다.

앤서니 브라운의 원더랜드 뮤지엄展 티켓오픈 안내입니다.


상품소개
앤서니 브라운의 원더랜드 뮤지엄展
2022.04.28 - 2022.08.31
예술의전당 한가람미술관
관람시간 : 오전 10시 ~ 오후 7시 (입장마감 오후 6시) 매주 월요일 휴관
 
 
할인정보
1차 얼리버드 가족권 (성인2+어린이, 청소년1) - 26,500원
1차 얼리버드 대인 - 10,000원
1차 얼리버드 소인 - 10,000원',date_format('2021-12-10', '%Y-%m-%d'));
insert into bbsList (divisions, title,content) values
('FAQ','휴면계정은 무엇인가요?',
'휴면계정이란 일정기간(만1년) 동안 회원이 YES24 사이트에 로그인 하지 않았을 경우, 원활한 회원관리를 위해 

사이트 이용 및 해당 계정으로 지급된 일체의 적립금 사용을 제한하는 정책입니다.

이후 다시 회원이 로그인을 하게 되면 휴면계정 안내와 철회 여부를 확인하게 됩니다. 

이때 비밀번호만 한번 더 입력하시면 종전의 회원자격과 적립금을 다시 활성화시켜 드립니다.

※휴면회원이 직접 로그인을 하여 서비스를 이용하게 되면 휴면 회원 해제처리 됩니다.');

insert into bbsList (divisions, title,content) values
('FAQ','예매한 티켓의 결제수단 변경이 가능한가요?',
'예매를 완료하신 티켓은 결제수단을 변경하실 수 없으며, 신용카드로 결제하신 티켓도 할부 개월 수를

변경하실 수 없습니다.

티켓 예매 후 결제수단이나 할부 개월 수를 변경하시려면 예매한 티켓을 취소하시고 원하시는 결제

방법으로 다시 예매를 해주셔야 합니다.

단, 공연이 이미 지난 경우에는 취소 후 재예매 불가하며, 취소마감시간이 남아 있는 경우에만 가능합니다.');

insert into bbsList (divisions, title,content) values
('FAQ','티켓 예매는 언제까지 할 수 있나요?',
'기본 예매마감시간은 취소마감시간과 동일하게 진행하고 있습니다.


[일요일~금요일 : 오후 17:00까지 / 토요일 : 오전 11:00까지]


다만, 공연 당일에도 예매 가능하도록 진행하는 공연들은 공연상페이지 우측상단에

[예매가능 관람일자 > 예매가능시간] 부분에  관람일 몇시간전까지 예매가 가능하다고

개별적으로 표시되어 있습니다.');

insert into bbsList (divisions, title,content) values
('FAQ','회원가입은 어떻게 하나요?',
' E-TICKET PC WEB을 통해 회원가입이 가능합니다.

1. [회원가입] 버튼 선택 > 회원 선택 > 약관동의 

2. 본인인증 진행

3. 회원가입 완료

* 글로벌회원은 별도의 본인인증 절차 없이 회원가입이 가능합니다.');

insert into bbsList (divisions, header, title, wName, content, postDate) values
('공지사항','[이벤트]','Hello Spring Event: 설레이는 봄, 전시회 봄','관리자',
'안녕하세요. E-TICKET 입니다.

따스한 봄, 설레이는 빅 이벤트 !

이벤트 응모 시 추첨을 통하여 2인 예매권을 드립니다.


2022. 04. 01 ~ 2022. 04 . 30
당첨자 발표 : 2022. 05. 02


※참고해주세요

본 이벤트는 ID 1개당 1회 참여만 가능합니다.
중복으로 참여하시더라도 당첨 확률에는 영향을 미치지 않습니다.
본 이벤트는 예고없이 사전에 종료될 수 있습니다.
본 이벤트는 부적절한 행위 확인 시 당첨이 취소될 수 있습니다.
기타 이벤트 관련 문의사항은 1:1문의 게시판을 이용해주세요.',
date_format('2022-03-28', '%Y-%m-%d'));

insert into bbsList (divisions, title,content) values
('FAQ', '배송지 변경은 언제까지 가능한가요?',
'배송지 주소 변경은 발권 전 까지만 가능합니다.

(WEB, 고객센터 공통)

배송상태가 배송준비중 또는 배송중일 경우 배송지 주소 변경 뿐만 아니라 취소 또한 불가합니다.');

insert into bbsList (divisions, header, title, wName, content, fileName,postDate) values
('공지사항','[안내]','이용약관 개정안내', '관리자',
'안녕하세요. E-TICKET입니다.

E-TICKET 서비스 이용 약관이 아래와 같이 개정되오니 참고하시기 바랍니다.

 
[약관개정]

개정목적 : 회원 종류 별 정의 변경 및 공연서비스 약관 추가 등  

시행일자 : 2022. 05. 10 ~ 

주요내용 :

1. [변경] 제1장 총칙 - 회원 종류 별 정의 수정 

2. [변경] 제10장 공연 서비스 - 예매/수수료/배송/취소/환불/불법거래에 관한 조항 추가 

2. [변경] 공통 - 이용자, 회원에 대한 명칭 통일 

 
앞으로도 더 큰 만족을 드릴 수 있도록 최선을 다하겠습니다.

감사합니다.',
'test.gif' ,date_format(now(), '%Y-%m-%d'));

insert into bbsList (divisions, header, title, wName, content, fileName,postDate) values
('공지사항','[이벤트]','설레이는 봄, 전시회 봄 이벤트 안내','관리자',
'설레이는 봄 이벤트를 실시 합니다.

이벤트 기간내에 전시회 예매 시 추첨을 통해 2인 예매권을 드립니다.',

'event-spring-booking.png',date_format('2022-04-20', '%Y-%m-%d'));

drop table bbsList;

select * from bbsList order by no limit 0,10;
select count(*) from bbsList where division='공지사항';
select * from bbsList where division='공지사항' order by no desc limit 0,10 ;
select * from bbsList where no=2 and division='공지사항';
select * from bbsList where division='공지사항' and title like '%택배%' order by no desc;
set global max_connections=500;
set wait_timeout=50;
/*set sql_safe_updates=0;
update bbsList set division = '공지사항'
where no=3; 
update bbsList set title = '택배사 변경안내'
where no=3;
*/

/*게시판용 테이블 끝*/












/* 상품 리스트 */
## flag : 투데이특가, 바로사용, MD추천 (최대 3개까지 가능)
## pArea : 지역별 선택 탭 (전체, 서울, 경기/인천, 대전/충청/강원)
## pLocation : 리스트 안의 내용(위치)
## pGroup : 분류 (전체, 전시, 체험/행사, 기타)
## pRegDate : 등록시간 => 최신순 탭
## pViewCnt : 조회수 => 인기순 탭
## joinWait : 관리자 등록승인
create table proList(
pNo					int				auto_increment		not null,
pUId					char(15)		,
pFlag1				char(10)		,
pFlag2				char(10)		,
pFlag3				char(10)		,
pArea				char(10)		,
pLocation			varchar(100)	,
pGroup				char(10)		,
pInfoTxt				char(100)		,
pTitle					char(100)		,
pDate1				char(30)		,
pDate2				char(30)		,
pContent			char(100)		,
pOriPrice			int				,
pSalePercent 		int				,
pRegDate			date				,
pViewCnt			int				,
pViewTime			char(100)		,
pClass				char(10)		,
pDelivery			char(10)		,
pImg					char(100)		,
pDetailImg			char(100)		,
joinWait 			char(2)			,
constraint primary key (pNo)
);

insert into proList (pUId, pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg, pDetailImg, joinWait) values 
 ('seller', '바로사용', '강원', '동해', '전시', '온라인 예매 시 당일사용가능', '앤서니 브라운의 원더랜드 뮤지엄展 - 예술의전당', '2022.04.28', '2022.05.31', 
 '예술의 전당 한가람미술관 2층', 20000, 58, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00 (입장마감: 18:00) / 매주 일요일 휴관', '전체관람가', '현장수령', 'product-list-img1.jpg', 'product-detail-img1.png', 'N');
insert into proList (pUId, pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg, pDetailImg, joinWait) values 
 ('seller', '투데이특가', '바로사용', '대전', '도룡동', '기타', '오늘 마지막!! 온라인 예매 투데이 특가 할인 당일사용가능', '빈센트 반 고흐: 향기를 만나다展', 
 '2022.04.16', '2022.08.28', '갤러리 헤이리스', 10000, 50, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00 (입장 마감 18:00) / 매주 일요일 휴관(공휴일일 경우 정상 운영, 홈페이지 참조)', '전체관람가', '현장수령', 'product-list-img2.jpg', 'product-detail-img2.png', 'N');
insert into proList (pUId, pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg, pDetailImg, joinWait) values 
 ('seller', 'MD추천', '바로사용', '인천', '센트럴로', '행사', '온라인 예매 쿠폰 할인 전시 정상 운영중', '어느 봄날, 테레사 프레이타스 사진전', 
 '2022.01.29', '2022.07.24', '더현대 서울 ALT.1', 13000, 0, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00(입장마감 18:00) / 매주 일요일 휴관', '전체관람가', '현장수령', 'product-list-img3.jpg', 'product-detail-img3.png', 'N');
insert into proList (pUId, pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg, pDetailImg, joinWait) values 
 ('seller', '바로사용', '경기', '안산시', '체험', '온라인 예매할인 당일사용가능', '로그아웃 - 지금 당신에게 필요한 순간', 
 '2021.12.21', '2023.03.01', '뚝섬미술관', 15000, 10, date_format(now(), '%Y-%m-%d'), '10: 00 ~ 19:00 (입장 마감 18:00) / 매주 일요일 휴관', '전체관람가', '현장수령', 'product-list-img4.jpg', 'product-detail-img4.png', 'N');
insert into proList (pUId, pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg, pDetailImg, joinWait) values 
 ('seller', '투데이특가', '서울', '용산', '전시', '온라인 예매 투데이 특가 할인', '영국 현대미술의 거장, 마이클 크레이그 마틴展', 
 '2022.04.08', '2022.05.22', '예술의 전당 한가람미술관 1층', 20000, 30, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00  (입장마감: 18:00) / 매주 일요일 휴관', '전체관람가', '현장수령', 'product-list-img12345.jpg', 'product-detail-img5.png', 'N');



drop table proList;
desc proList;
truncate proList;
select * from proList;
select * from proList order by pNo Asc;

## 판매자 문의
create table pWSel(
pWPNo		int,
pWUId		char(15),
pWrite		varchar(500)
);

drop table pWsel;
truncate pWSel;
select * from pWSel;

## 리뷰 리스트
## pRevPhoto : 사진 유무
## pRevImg : 사진명
## pRevRecom : 추천수
## pRevStar : 별점
create table pRevList(
pRevNo			int		auto_increment unique,
pRevPNo			int,
pRevUId			char(15),
pRevPhoto		int,
pRevImg			varchar(100),
pRevCont		varchar(500),
pRevDate		datetime,
pRevRecom		int,
pRevStar		int
);

insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, 'hello123', 0, '너무 재밌었어요~ 만족합니다!', now(), 0, 3);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevImg, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, 'lalalala', 1, 'product-review-img1.jpg', '인스타에서 보고 가보고 싶어 예매해서 잘보고 갑니다. 사진 색감이 너무 이뻐요~ 봄 여행을 다녀온 것 같았습니다. 대신 티켓값에 비해 볼 것은 그렇게 많지 않았다는 점 참고해주세요~', now(), 0, 4);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevImg, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, 'dksjdkn', 1, 'product-review-img2.jpg', '사람이 너무 많았어요 ㅠㅠ 주말대신 평일 오전에 가시는 것을 추천합니다! 생각보다 내부가 넓고 전시 다 보려면 2시간정도 걸려요.', now(), 0, 4);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevImg, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, 'skjd567', 1, 'product-review-img3.jpg', '정말 잘봤습니다', now(), 0, 5);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevImg, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, '12dkhjd12', 1, 'product-review-img4.jpg', '저희 딸이랑 다녀왔는데 전시에 체험이 없어서 아이는 조금 재미없어하더라구요 ^^;;;', now(), 0, 3);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevImg, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, '4857dfjfbs',  1, 'product-review-img5.jpg', '추천해요~~ 사람이 워낙 많아서 빨리 다녀와야 할 것 같아요!', now(), 0, 5);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, 'hjfawevd',  0, '굿굿!', now(), 0, 3);
insert into pRevList (pRevPNo, pRevUId, pRevPhoto, pRevImg, pRevCont, pRevDate, pRevRecom, pRevStar) values 
(1, 'dddddd123',  1, 'product-review-img6.jpg', '추천해요~~ 사람이 워낙 많아서 빨리 다녀와야 할 것 같아요!', '2022-04-19 13:34:03', 0, 4);

set sql_safe_updates = 0;
drop table pRevList;
desc pRevList;
truncate pRevList;
select * from pRevList;

## 예약하기
create table pReserve(
pResNo				int auto_increment unique,
pResPNo				int,
pResUId				char(15),
pResDate			date,
pResTime			char(20),
pResUseM			int,
pResRemainM		int,
pResHead			int,
pResPrice			int,
pResCPay			char(10),
pResCAccount		varchar(100)
);

desc pReserve;
truncate pReserve;
select * from pReserve;
drop table pReserve;

/* // 상품 리스트 */









create table eventList (
eNo int auto_increment not null,
eTitle char(40) not null,
eContent varchar(300),
eMainImg char(100),
eInnerImg char(100),
eStart char(20),
eEnd char(20),
eRes char(20),
eTag char(10) not null,
eType char(10) not null,
constraint primary key(eNo)
);

drop table eventList;

select * from eventList;

insert into eventList (eTitle, eContent, eMainImg, eInnerImg, eStart, eEnd, eTag, eType) values ('크리스마스 예매 이벤트', '이벤트 내용', 'event-christmas-gift.png', 'event-christmas-gift.png', '2021-12-20', '2021-12-30', '종료', '예매이벤트');

insert into eventList (eTitle, eContent, eMainImg, eInnerImg, eStart, eEnd, eRes, eTag, eType) values ('설레이는 봄, 전시회 봄', '이벤트 내용', 'event-spring-booking.png', 'event-spring-booking.png', '2022-04-01', '2022-04-30', '2022-05-03', '진행중', '응모이벤트');

insert into eventList (eTitle, eContent, eMainImg, eInnerImg, eStart, eEnd, eRes, eTag, eType) values ('앤서니 브라운의 원더랜드 뮤지엄 기대평 이벤트', '이벤트 내용', 'event-reply-product1.jpg', 'event-reply-product1-detail.jpg', '2022-04-01', '2022-04-08', '2022-05-03', '진행중', '기대평이벤트');

create table event (
	uId char(15) not null,
    eNo int not null
);

update eventList set eTag = '종료' where eNo = 3;

drop table event;
select * from event;

create table replyEvent (
	rNo int auto_increment not null,
	uId char(15) not null,
    eNo int not null,
    eTxt char(255) not null,
    eDate timestamp not null,
    constraint primary key(rNo)
);

drop table replyEvent;

insert into replyEvent (uId, eNo, eTxt, eDate) values ('아이디', 3, '너무 기대돼용~', now());

select * from replyEvent;

select * from replyEvent where eDate = '2022-04-14 12:18:39';

create table wishList (
	uId char(15) not null,
    pNo int not null
);

drop table wishList;

select * from wishList;

/* 메인슬라이더 이미지 */
create table mainslidelist(
	mNo int auto_increment unique,
    mFileName char(100),
    mTitle char(30),
    constraint primary key (mFileName)
);

drop table mainslidelist;

truncate mainslidelist;


insert into mainslidelist(mFileName) values('product-list-slideimg1.jpg');

select * from mainslidelist;
