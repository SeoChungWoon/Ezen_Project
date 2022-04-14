## KKMSProj DB ##

create database KKMSProj;

use KKMSProj;

create table member (
no int auto_increment,
uId char(15) not null,
uPw char(16) not null,
uName char(20) not null,
uBirthday char(8) not null,
uGender char(6) not null,
uEmail char(50) not null,
uPhone char(11) not null,
uZipcode char(7) not null,
uAddr char(50) not null,
termsAds char(1),
constraint primary key(uId),
constraint unique key(no)
);

desc member;

insert into member values (3, 'A', '1234', 'abc', 'a', 'a', 'a', 'a', 'a', 'a', 'Y');
select count(*) from member where uId = 'a';


select * from member;

drop table member;









create table tblZipcode (
zipcode char(7),
area1 char(10),
area2 char(20),
area3 char(40),
area4 char(20)
);


/*공지게시판용 테이블 시작*/
create table bbsList (
no		int	auto_increment	not null,
division	char(20)	not null,
title		char(50)	not null,
wName	char(20)	not null,				/*wName = writerName*/
content varchar(1000),
postDate	date	not null,
count	int,
constraint primary key (no)
);

desc bbsList;


drop table bbsList;


insert into bbsList (no, division, title, wName,content,postDate) values
(1, '공지사항', '반품/교환 신청 및 조회 서비스 오픈!', '관리자',
'E-Ticket에서 상품을 구매하신 후 반품이나 교환을 원하시거나 주문하신 상품이 누락되었을 때
사이트에서 직접 신청하실 수 있는 반품/교환 신청 및 조회 메뉴가 마이페이지에 추가되었습니다.

메뉴 바로가기
'
, date_format(now(),'%Y-%m-%d'));

insert into bbsList (no, division, title, wName,content,postDate) values
(2, '공지사항', '이용약관 개정안','관리자',
'시행일자 : 2022년 04월 09일

주요 개정 내용

개정조항 : 제2조(용어의 정리)

개정내용 :

- 6. 디지털상품 : 동영상, eTicket, e러닝, E-Ticket 클럽 및 음원과 같이 VOD, 스트리밍, 다운로드 등의 형태로 제공되는 무배송 상품을 말합니다.

- 8. 라.캐시 : 디지털상품 중 웹소설/코믹을 구매할 때, 현금처럼 사용할 수 있는 사이버머니

- 11. sey코인 : 회사의 웹소설/코믹에서 운영하는 가상화폐로 회사가 정한 기준에 따라 지급'
,date_format(now(), '%Y-%m-%d'));

insert into bbsList (no, division, title, wName,content,postDate) values
(3, '공지사항', '택배사 변경안내', '관리자',
'04월 11일부터 하루배송 택배사가 CJ 대한통운으로 변경되어 안내 드립니다.

▶ 배송 대행 업체 변경

1) 당일 배송 대행 : GTX -> 한진택배

2) 일반 배송 (하루배송) 대행  : KG로지스 -> CJ 대한통운'
, date_format(now(), '%Y-%m-%d'));

select * from bbsList order by no limit 0,10;

set global max_connections=500;
set wait_timeout=50;
/*set sql_safe_updates=0;
update bbsList set division = '공지사항'
where no=3; 
update bbsList set title = '택배사 변경안내'
where no=3;
*/

/*공지게시판용 테이블 끝*/

/* FAQ게시판용 테이블 시작*/
create table faqList(
fNo	int	auto_increment	not null,
fDivision char(20)	not null,
fTitle		char(50)	not null,				
fContent varchar(1000)	not null,
constraint primary key (fNo)
);

insert into faqList (fNo, fDivision, fTitle, fContent) values
(1, '주문/결제', '주문내역은 어디서 확인하나요?',
'  ▷ 주문내역은 로그인 후, 마이페이지>예매내역에서 확인 하실 수 있습니다.');
insert into faqList values
(2, '취소/교환', '휴대폰으로 결제한 경우 취소시 환불은 어떻게 되나요?',
' ▷  휴대폰결제를 통한 주문 시 결제대금이 다음 달 휴대폰요금과 함께 청구되며,
      이동통신사 정책에 따라 결제 승인 취소는 해당 월 내에만 가능합니다.

      ※ 휴대폰 결제 취소는 주문한 달의 말일까지만 가능

      익월 취소시에는 예치금으로 환불 (통신사 정책에 따라 승인취소 불가능)');
insert into faqList values
(3, '회원정보', '아이디,비밀번호를 잊어버렸어요. 어떻게 해야 하나요?',
' ▷  아이디 찾기
	  회원 로그인 화면에서 [아이디 찾기]를 클릭하여 인증을 통해 확인이 가능합니다.

	  비밀번호 찾기
	  회원 로그인 화면에서 [비밀번호 찾기]를 클릭 하여 아이디 와 가입 시 기입한 이메일 주소 또는 휴대폰번호를 입력 하여 임시비밀번호 발급이 가능합니다.
	  위의 정보로 받을 수 없는 경우 본인인증 후 새 비밀번호로 변경해주세요.');


drop table faqList;
/* FAQ게시판용 테이블 끝*/


/* 상품 리스트 */
## flag : 투데이특가, 바로사용, 쿠폰할인, MD추천 (최대 3개까지 가능)
## pArea : 지역별 선택 탭 (전체, 서울, 경기/인천, 대전/충청/강원)
## pLocation : 리스트 안의 내용(위치)
## pGroup : 분류 (전체, 전시, 체험/행사, 기타)
## pRegDate : 등록시간 => 최신순 탭
## pViewCnt : 조회수 => 인기순 탭
create table proList(
pNo					int				auto_increment		not null,
pFlag1				char(10)		not null,
pFlag2				char(10)		,
pFlag3				char(10)		,
pArea				char(10)		not null,
pLocation			char(10)		not null,
pGroup				char(10)		not null,
pInfoTxt				char(100)		not null,
pTitle					char(100)		not null,
pDate1				char(30)		not null,
pDate2				char(30)		not null,
pContent			char(100)		not null,
pOriPrice			int				not null,
pSalePercent 		int				,
pRegDate			date				not null,
pViewCnt			int				,
pViewTime			char(100)		not null,
pClass				char(10)		not null,
pDelivery			char(10)		not null,
constraint primary key (pNo)
);

insert into proList (pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery) values 
 ('바로사용', '강원', '동해', '전시', '온라인 예매 시 당일사용가능', '앤서니 브라운의 원더랜드 뮤지엄展 - 예술의전당', '2022.04.28', '2022.05.31', 
 '예술의 전당 한가람미술관 2층', 20000, 58, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00 (입장마감: 18:00) / 매주 월요일 휴관', '전체관람가', '현장수령');
insert into proList (pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery) values 
 ('투데이특가', '바로사용', '대전', '도룡동', '기타', '오늘 마지막!! 온라인 예매 투데이 특가 할인 당일사용가능', '빈센트 반 고흐: 향기를 만나다展', 
 '2022.04.16', '2022.08.28', '갤러리 헤이리스', 10000, 50, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00 (입장 마감 18:00) / 매주 월요일 휴관(공휴일일 경우 정상 운영, 홈페이지 참조)', '전체관람가', '현장수령');
insert into proList (pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery) values 
 ('MD추천', '쿠폰할인', '인천', '센트럴로', '행사', '온라인 예매 쿠폰 할인 전시 정상 운영중', '어느 봄날, 테레사 프레이타스 사진전', 
 '2022.01.29', '2022.04.24', '더현대 서울 ALT.1', 13000, 8, date_format(now(), '%Y-%m-%d'), '10:30 ~ 20:00(입장마감 19:00) / 더현대 서울 월별 휴무일 휴관 (별도공지)', '전체관람가', '현장수령');
insert into proList (pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery) values 
 ('바로사용', '쿠폰할인', '경기', '안산시', '체험', '온라인 예매할인 당일사용가능', '로그아웃 - 지금 당신에게 필요한 순간', 
 '2021.12.21', '2023.03.01', '뚝섬미술관', 15000, 10, date_format(now(), '%Y-%m-%d'), '11: 00 ~ 19:00 (입장 마감 18:20)', '전체관람가', '현장수령');
insert into proList (pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery) values 
 ('투데이특가', '서울', '용산', '전시', '온라인 예매 투데이 특가 할인', '영국 현대미술의 거장, 마이클 크레이그 마틴展', 
 '2022.04.08', '2022.05.22', '예술의 전당 한가람미술관 1층', 20000, 30, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00  (입장마감: 18:00) / 매주 월요일 휴관', '전체관람가', '현장수령');

drop table proList;
desc proList;
truncate proList;
alter table proList drop column pFlag3;
select * from proList;
select * from proList order by pNo Asc;

## detail info
## pContactSel : 판매자 문의 내용
create table proLDetail(
pNo					int				not null,
pContactSel		VARCHAR(500)		,

constraint foreign key(pNo) references proList(pNo)
);

drop table proLDetail;
desc proLDetail;
truncate proLDetail;
select * from proLDetail;
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