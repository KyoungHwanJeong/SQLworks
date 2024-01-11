--community
create table community(
review_no number primary key,
title varchar2(100) not null,
local_name varchar2(50),  -- ���� �̸�
review_content clob,  --clob�� ���� ���� ���� ������ ��
review_createdate timestamp default systimestamp, --��۾���¥
review_modifydate timestamp,  --������¥
hit number default 0, -- ��ȸ��
filename varchar2(50), --����÷�� 
user_id varchar2(20) not null,
replycnt number default 0, --��� ��
foreign key(user_id) references users(user_id) on delete cascade
);

create sequence seq_review_no nocache;

drop table community;
drop sequence seq_review_no;

commit;

insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '������1', '�����̸��Դϴ�1.', 'ubin');
insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '������2', '�����̸��Դϴ�2.', 'ubin');
insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '������3', '�����̸��Դϴ�3.', 'ubin');
insert into community(review_no, title, local_name, user_id)
values (seq_review_no.nextval, '������4', '�����̸��Դϴ�4.', 'ubin');

--��ͺ���
insert into community (review_no, title, local_name, user_id)
(select seq_review_no.nextval, title, local_name, user_id from community);

commit;
select * from community;        -- ��ü ���

SELECT * FROM community ORDER BY review_no DESC;

-- ������ ó��
select rownum, community.*
from community where rownum>0 and rownum <=10; --10�ٱ��� ó��


--�� �Խñ� ��
SELECT COUNT(*) AS total FROM community;


-- �Խñ� �˻�(����, ���̵�)
SELECT *
FROM community
WHERE title LIKE '%3%';  --3�� �� ���� �Խñ�

-- ���
SELECT * FROM reply WHERE review_no = 1;

-- ��� �� ����ϱ�
UPDATE community
SET replycnt = (
            SELECT count(reply_no) 
            FROM reply
            WHERE review_no = 2)
WHERE review_no = 2;
    
-- ��� �� 1
UPDATE community c
SET c.replycnt = (
            SELECT count(reply_no) 
            FROM reply
            WHERE reply.review_no = c.review_no
    );

SELECT count(reply_no) 
FROM reply
WHERE review_no = 1;

-- �Խñ� ����
UPDATE community SET title = '������5', review_content = '�ƹ��ų� �ƹ��ų� ��' WHERE review_No = 1;

-- �Խñ� ����
DELETE FROM community WHERE review_no = 9;

-- �Խ� ��¥ ������ �����ϱ�
SELECT * FROM community ORDER BY community.review_createdate;

-- 

SELECT * FROM community 
WHERE '�ۼ���' LIKE '�ۼ���' ORDER BY review_no;

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
	                	 WHERE title LIKE '�ۼ���')
                            AND (SELECT * FROM community ORDER BY review_createdate DESC)) bo)
	                     WHERE RM >= 1 AND RM <= 10;

SELECT * FROM community  WHERE title LIKE '������';

SELECT * 
                     FROM (SELECT ROWNUM RM, bo.* 
                     FROM (SELECT * FROM community 
                     WHERE title LIKE '������' ORDER BY review_no DESC) bo)
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