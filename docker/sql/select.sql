/*
	SELECT(데이터 조회)
    SELECT 컬럼1, 컬럼2 FROM 테이블명;
*/

select student_name as SN, student_age, student_age
from student_tb 
where student_age > 25;

SELECT 10 as number;
SELECT 10 + 20 as number2;
SELECT *
FROM (SELECT 10 + 20 as number2, 40 as number3) as n_s;

/* SELECT 결과들을 합치는 방법(UNION(중복 제거), UNION ALL(중복 허용))
	제약 조건
    1. 컬럼의 갯수가 일치해야 한다.
    2. 테이블을 SELECT 한 결과를 합치려면 자료형도 일치해야 한다.
*/
SELECT 30,40 UNION SELECT 50, '가';

SELECT 10,20 UNION ALL SELECT 10,20;

/*
	JOIN(테이블 합치기)
    SELECT * FROM 테이블1 JOIN 테이블2;
    
    
*/
SELECT * FROM student_tb as st1 JOIN student_tb as st2;

SELECT * 
	FROM student_tb as st1 
    INNER JOIN 
    student_tb st2
    ON(st2.student_id = st1.student_id + 1)
    LEFT JOIN
    student_tb st3
    ON(st3.student_id = st2.student_id + 1);
    
SELECT
	*
FROM
	student_tb as st1 
    INNER JOIN student_tb st2 ON(st2.student_id = st1.student_id + 1)
    LEFT OUTER JOIN student_tb st3 ON(st3.student_id = st2.student_id + 1);

/*
	ON 절에서 join 뒤에 붙는 테이블을 먼저 작성 한다.
    
	for(int i = 0; i < 10; i++) {
		for(int j = 0; j < 10; j++){
			if(j == i) {
				테이블 붙이기
			}}}
*/

/*
	서브쿼리(하위쿼리)
*/
explain analyze select
	cre.class_register_id, 
    cre.class_id, 
    ctb.class_name, 
    cre.student_id, 
    stb.student_name
from
	class_register_tb cre
    join student_tb stb on (stb.student_id = cre.student_id)
    join class_tb ctb on (ctb.class_id = cre.class_id)
where
	stb.student_name = '이서연';

insert into db_study.class_register_tb
values
	(default, 1, 2),
	(default, 1, 3),
	(default, 1, 4),
	(default, 2, 2),
	(default, 2, 5),
	(default, 2, 7),
	(default, 2, 9);
    
select 
	crt.class_id,
    (select class_name from class_tb as ct where ct.class_id = crt.class_id) as class_name
from
	class_register_tb crt
where
	student_id = (	select
						student_id
					from
						student_tb
					where
						student_name = '이서연');
                        
/*
	쿼리 성능 비교
    적은 컬럼의 출력시에는 서브쿼리가 나을 수 있음.
    많은 컬럼의 출력시에는 조인이 나을 수 있음.
    상황에 따라 사용해야 하며, 정확히 하게는 측정 후 비교 후 나은 선택지 사용 추천
    속도 측정 explain analyze 을 select 앞에 붙여서 사용
    -> Table scan on student_tb  (cost=1.35 rows=11) (actual time=0.0337..0.0405 rows=11 loops=1)
    로 결과 나옴 actual time 을 비교!
*/
explain analyze select * from student_tb;
explain analyze select * from class_tb;