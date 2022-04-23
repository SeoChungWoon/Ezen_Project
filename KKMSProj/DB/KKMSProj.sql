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
constraint primary key(uId),
constraint unique key(no)
);

alter table member add column ePay int;
alter table member drop column ePay;


insert into member values (1, 'admin', 'admin', '관리자', '00000000', 'null', 'null', '01012345678', 'null', 'null', '', '관리자', '');
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



/*게시판용 테이블 시작*/
create table bbsList (
no		int	auto_increment	not null,
divisions	char(20)	not null,
title		char(50)	not null,
wName	char(20)	not null,				/*wName = writerName*/
content varchar(1000),
postDate	date	not null,
count	int,
constraint primary key (no)
);

desc bbsList;


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
create table proList(
pNo					int				auto_increment		not null,
pFlag1				char(10)		,
pFlag2				char(10)		,
pFlag3				char(10)		,
pArea				char(10)		,
pLocation			char(10)		,
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
constraint primary key (pNo)
);

insert into proList (pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg) values 
 ('바로사용', '강원', '동해', '전시', '온라인 예매 시 당일사용가능', '앤서니 브라운의 원더랜드 뮤지엄展 - 예술의전당', '2022.04.28', '2022.05.31', 
 '예술의 전당 한가람미술관 2층', 20000, 58, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00 (입장마감: 18:00) / 매주 월요일 휴관', '전체관람가', '현장수령', 'product-list-img1.jpg');
insert into proList (pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg) values 
 ('투데이특가', '바로사용', '대전', '도룡동', '기타', '오늘 마지막!! 온라인 예매 투데이 특가 할인 당일사용가능', '빈센트 반 고흐: 향기를 만나다展', 
 '2022.04.16', '2022.08.28', '갤러리 헤이리스', 10000, 50, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00 (입장 마감 18:00) / 매주 월요일 휴관(공휴일일 경우 정상 운영, 홈페이지 참조)', '전체관람가', '현장수령', 'product-list-img2.jpg');
insert into proList (pFlag1, pFlag2, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg) values 
 ('MD추천', '바로사용', '인천', '센트럴로', '행사', '온라인 예매 쿠폰 할인 전시 정상 운영중', '어느 봄날, 테레사 프레이타스 사진전', 
 '2022.01.29', '2022.07.24', '더현대 서울 ALT.1', 13000, 0, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00(입장마감 18:00) / 더현대 서울 월별 휴무일 휴관 (별도공지)', '전체관람가', '현장수령', 'product-list-img3.jpg');
insert into proList (pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg) values 
 ('바로사용', '경기', '안산시', '체험', '온라인 예매할인 당일사용가능', '로그아웃 - 지금 당신에게 필요한 순간', 
 '2021.12.21', '2023.03.01', '뚝섬미술관', 15000, 10, date_format(now(), '%Y-%m-%d'), '10: 00 ~ 19:00 (입장 마감 18:00)', '전체관람가', '현장수령', 'product-list-img4.jpg');
insert into proList (pFlag1, pArea, pLocation, pGroup, pInfoTxt, pTitle, pDate1, pDate2, pContent, pOriprice, pSalePercent, pRegDate, pViewTime, pClass, pDelivery, pImg) values 
 ('투데이특가', '서울', '용산', '전시', '온라인 예매 투데이 특가 할인', '영국 현대미술의 거장, 마이클 크레이그 마틴展', 
 '2022.04.08', '2022.05.22', '예술의 전당 한가람미술관 1층', 20000, 30, date_format(now(), '%Y-%m-%d'), '10:00 ~ 19:00  (입장마감: 18:00) / 매주 월요일 휴관', '전체관람가', '현장수령', 'product-list-img12345.jpg');



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
select pWUId from pWSel where pWUId = 'admin' and pWPNo = 3;
drop table pWsel;
delete from pWSel where pWPNo = 3 and pWUId = 'hello';
select * from pWSel;
truncate pWSel;

select count(*) from pWSel where pWUId = 'hi';

## 리뷰 리스트
create table pRevList(
pRevPNo			int,
pRevNo			int		auto_increment unique,
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
delete from pRevList where pRevUId = 'admin';
update pRevList set pRevRecom = 0 where pRevUId = 'hi' and pRevPNo = 1;
select * from pRevList;
select * from pRevList where pRevPNo = 1 order by pRevDate Desc;
select * from pRevList where pRevUId = 'hello' and pRevPNo = 3;
select count(*) from pRevList where pRevUId = 'hello';
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

