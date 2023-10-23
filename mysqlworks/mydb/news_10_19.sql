
use mydb;			-- 사용할 db
-- news 테이블 생성
CREATE TABLE news(
	aid			INT PRIMARY KEY AUTO_INCREMENT, -- 기사글번호(article id)
    title		VARCHAR(100) NOT NULL,			-- 제목
    content		TEXT NOT NULL,					-- 내용
    create_date	TIMESTAMP DEFAULT now(),		-- 등록일	
    img			VARCHAR(40)						-- 이미지파일
);

INSERT INTO news(title, content, img) 	-- auto_increment : 일련번호, 시퀀스
VALUES('경제 뉴스', '휘발유값이 너무 올랐습니다.', 'car.jpg');
INSERT INTO news(title, content, img) 
VALUES('정치 뉴스', '이스라엘과 팔레스타인 전쟁', 'war.jpg');
INSERT INTO news(title, content, img) 
VALUES('스포츠 뉴스', '한국과 베트남 축구 성적 - 6:0', 'soccer.jpg');
INSERT INTO news(title, content, img) 
VALUES('과학 뉴스', '협동로봇, 청소 서비스로봇', 'robot.png');


SELECT * FROM news ORDER BY create_date DESC;


-- 등록 시간 순으로 정렬하시오(최근 등록일이 위로 올라가게)
select * from news
order by create_date desc;

-- 뉴스 내용 중에 '이스라엘'이 포함된 뉴스를 검색하시오
select * from news
where content like '%이스라엘%';

-- 뉴스 기사의 총개수
select count(*) "기사 수" from news;

--

COMMIT;

drop table news;