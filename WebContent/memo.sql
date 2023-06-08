CREATE TABLE text2(
num int NOT NULL PRIMARY Key,
namae varchar2(20),
title varchar2(50)
);
   
CREATE SEQUENCE auto_num INCREMENT BY 1;
   
DROP TABLE text2;
   
DROP SEQUENCE auto_num;
Insert into text2(num, namae, title) Values(auto_num.NEXTVAL, 'kbs', 'Hello World');

Insert into text2(num, namae, title) Values(auto_num.NEXTVAL, 'admin', '한글 테스트');

