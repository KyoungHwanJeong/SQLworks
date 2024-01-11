--community
create table community(
review_no number primary key,
title varchar2(100) not null,
local_name varchar2(50),  -- 공간 이름
review_content clob,  --clob은 많은 양의 글자 담을때 씀
review_createdate timestamp default systimestamp, --댓글쓴날짜
review_modifydate timestamp,  --수정날짜
hit number default 0, -- 조회수
filename varchar2(50), --사진첨부 
user_id varchar2(20) not null,
replycnt number default 0, --댓글 수
foreign key(user_id) references users(user_id) on delete cascade
);

create sequence seq_review_no nocache;

drop table community;
drop sequence seq_review_no;

commit;

insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '글제목1', '공간이름입니다1.', 'ubin');
insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '글제목2', '공간이름입니다2.', 'ubin');
insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '글제목3', '공간이름입니다3.', 'ubin');
insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '글제목4', '공간이름입니다4.', 'ubin');

--재귀복사
insert into community (review_no, title, local_name, user_id)
(select seq_review_no.nextval, title, local_name, user_id from community);

commit;
select * from community;        -- 전체 출력

SELECT * FROM community ORDER BY review_no DESC;

-- 페이지 처리
select rownum, community.*
from community where rownum>0 and rownum <=10; --10줄까지 처리


--총 게시글 수
SELECT COUNT(*) AS total FROM community;


-- 게시글 검색(제목, 아이디)
SELECT *
FROM community
WHERE title LIKE '%3%';  --3이 들어간 제목 게시글

-- 댓글
SELECT * FROM reply WHERE review_no = 1;

-- 댓글 수 계산하기
UPDATE community
SET replycnt = (
            SELECT count(reply_no) 
            FROM reply
            WHERE review_no = 2)
WHERE review_no = 2;
    
-- 댓글 수 1
UPDATE community c
SET c.replycnt = (
            SELECT count(reply_no) 
            FROM reply
            WHERE reply.review_no = c.review_no
    );

SELECT count(reply_no) 
FROM reply
WHERE review_no = 1;

-- 게시글 수정
UPDATE community SET title = '글제목5', review_content = '아무거나 아무거나 씀' WHERE review_No = 1;

-- 게시글 삭제
DELETE FROM community WHERE review_no = 9;

-- 게시 날짜 순으로 정렬하기
SELECT * FROM community ORDER BY community.review_createdate;

-- 

SELECT * FROM community 
WHERE '글수정' LIKE '글수정' ORDER BY review_no;

SELECT * FROM (SELECT ROWNUM RM, bo.* 
                FROM (SELECT * FROM community
                WHERE user_id LIKE '%ubin%' ORDER BY review_no) bo)
                WHERE RM >= 1 AND RM <= 15;
                
                
SELECT * FROM (SELECT ROWNUM RM, bo.* 
			                	FROM (SELECT * FROM community
			                	WHERE user_id LIKE '%ubin%' ORDER BY review_no DESC) bo)
			                    WHERE RM >= 1 AND RM <= 20;

SELECT * 
								 FROM (SELECT ROWNUM RM, bo.* 
			                	 FROM (SELECT * FROM community 
			                	 WHERE user_id LIKE '%ubin%' ORDER BY review_no DESC) bo) 
			                     WHERE RM >= 1 AND RM <= 10;

SELECT * FROM community ORDER BY hit DESC;

SELECT * FROM community ORDER BY local_name DESC;


SELECT * 
						 FROM (SELECT ROWNUM RM, bo.* 
	                	 FROM (SELECT * FROM community 
	                	 ORDER BY local_name DESC) bo) 
	                     WHERE RM >=1 AND RM <= 10
                         ORDER BY review_createdate DESC;

SELECT *
                        FROM (SELECT ROWNUM RM, bo.* 
	                	 FROM ((SELECT * FROM community 
	                	 WHERE title LIKE '글수정')
                            AND (SELECT * FROM community ORDER BY review_createdate DESC)) bo)
	                     WHERE RM >= 1 AND RM <= 10;

SELECT * FROM community  WHERE title LIKE '글제목';

SELECT * 
                     FROM (SELECT ROWNUM RM, bo.* 
                     FROM (SELECT * FROM community 
                     WHERE title LIKE '글제목' ORDER BY review_no DESC) bo)
                     WHERE RM >= 1 AND RM <= 10;

SELECT * 
FROM (SELECT ROWNUM RM, bo.* 
FROM (SELECT * FROM community 
WHERE user_id LIKE '%ubin%' ORDER BY hit DESC) bo) 
WHERE RM >= 1 AND RM <= 10;

SELECT * 
FROM (SELECT ROWNUM RM, bo.* 
FROM (SELECT * FROM community 
WHERE user_id LIKE '%ubin%' ORDER BY hit DESC) bo) 
WHERE RM >= 1 AND RM <= 10;

SELECT * 
FROM (SELECT ROWNUM RM, bo.* 
FROM (SELECT * FROM community 
WHERE user_id LIKE '%ubin%' ORDER BY (hit) DESC) bo) 
WHERE RM >= 1 AND RM <= 10;



commit;
select* from community;