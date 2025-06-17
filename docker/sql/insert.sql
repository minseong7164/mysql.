/*
	INSERT(데이터 삽입)
    INSERT INTO 테이블명(칼럼1, 칼럼2,...) VALUES(컬럼1데이터, 컬럼2데이터);
    컬럼명은 생략할 수 있다.
    
*/
insert into `db_study`.`student_tb`(`student_name`, `student_age`)
values ('염진우', 30);

insert into student_tb values ('염진운',30);
insert into student_tb(stduent_age) values (36);	# NULL 값을 넣을 수 있는 컬럼만 생략 가능
insert into student_tb(student_age, student_name) values (32,'염진욱');

/*
	여러줄 데이터 삽입
    INSERT INTO 테이블명(칼럼1, 칼럼2,...) VALUES('data1', 'data2'),('data3','data4');
*/
insert into student_tb 
values 
	('가5',44),
    ('가6',55);
    
/*
	수업(study_class_tb)을 정의. 컬럼은 아래와 같다
    class_name
    price
    student_name
    student_age
    
    각 컬럼에 아래의 데이터가 입력되도록 SQL문을 작성 하시오.
    
    
insert into class_register_tb
values 
	('Java 기초', 150000,'김민수',22),
	('Python 웹개발', 200000,'이서연',24),
	('React 입문', 180000,'박지훈',21),
	('Spring Boot 실전', 250000,'최유진',23),
	('SQL 마스터', 130000,'정예은',26),
	('JavaSrcipt 중급', 170000,'홍길동',20),
	('HTML/CSS 디자인', 120000,'신유나',19),
	('데이터 분석 입문', 210000,'김도윤',25),
	('Node.js 백엔드', 230000,'오하늘',22),
	('Flutter 앱개발', 240000,'배수현',27);
    
insert into class_register_tb
values
	('Java 기초', 		150000,'김민수',22),
	('Python 웹개발', 	200000,'김민수',22),
	('React 입문', 		180000,'김민수',22),
	('Spring Boot 실전', 250000,'최유진',23),
	('SQL 마스터', 		130000,'최유진',23),
	('JavaSrcipt 중급', 	170000,'최유진',23),
	('HTML/CSS 디자인', 	120000,'신유나',19),
	('데이터 분석 입문', 	210000,'신유나',19),
	('Node.js 백엔드', 	230000,'신유나',19),
	('Flutter 앱개발', 	240000,'배수현',27);
    
select * from class_register_tb;
*/

/*------------------------------------------------*/
insert into class_tb
values 
	(default, 'python', 20000);
    
insert into student_tb
values
	(default, '김민수',22),
	(default, '이서연',24),
	(default, '박지훈',21),
	(default, '최유진',23),
	(default, '정예은',26),
	(default, '홍길동',20),
	(default, '신유나',19),
	(default, '김도윤',25),
	(default, '오하늘',22),
	(default, '배수현',27);
    
select * from student_tb;

