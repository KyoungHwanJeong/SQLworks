--��ۿ���
create table reply(
reply_no number primary key,
review_no number not null,
reply_content varchar2(2000) not null,
reply_id varchar2(20) not null,
reply_date timestamp default systimestamp,
reply_update timestamp,
foreign key(review_no) references community(review_no)
);

create sequence seq_reply_no nocache;

drop sequence seq_reply_no;


INSERT INTO reply (reply_no, review_no, reply_content, reply_id)
VALUES (seq_reply_no.nextval, 1, 'ù��° ����Դϴ�.', 'ubin');
INSERT INTO reply (reply_no, review_no, reply_content, reply_id)
VALUES (seq_reply_no.nextval, 2, '�ι�° ����Դϴ�.', 'ubin');



COMMIT;

SELECT * FROM reply; -- ��ü ���

SELECT * FROM reply WHERE review_no = 1;

SELECT * FROM community ORDER BY review_no;

SELECT * FROM reply WHERE


DROP TABLE reply;
DROP SEQUENCE seq_reply_no;