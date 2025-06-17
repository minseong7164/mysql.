/*
	조건 연산자
    1. 비교 연산자
    2. in 연산자(OR)
    3. between A and B 연산자(AND)
*/
-- 1. 비교 연산자
select
	*
from
	product_tb
where
	price > 500000
    and stock > 400;
    
-- 2. in 연산자(OR)
-- 2.1 기초
select
	*
from
	product_tb
where
	brand_id = 1
    or brand_id = 2;
    
-- 2.2 활용1
select
	*
from
	product_tb
where
	brand_id in (1,2);
    
-- 2.3 활용2
select
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_id < 3);
-- 2.3 활용3
select
	*
from
	product_tb
where
	brand_id in (select brand_id from brand_tb where brand_name in ('LG','다이소'));

-- 3. between A and B 연산자(AND)
-- 3.1 기초
select
	*
from
	product_tb
where
	price >= 100000
    and price <= 200000;
    
-- 3.2 활용
select
	*
from
	product_tb
where
	price between 100000 and 200000;
    
-- 서브쿼리 & Null (is null, is not null)
-- is not null 을 제외한 부정은 where 절에서 조건을 걸 대상 앞에 붙인다.
-- null 확인
select
	*
from
	(select
		product_name,
		stock,
		if(stock = 0, '부족', null) as stock_status
	from
		product_tb) tpt
where
	stock_status is not null;

-- null 이외 부정시 not 명시 방법
select
	*
from
	(select
		product_name,
		stock,
		if(stock = 0, '부족', '') as stock_status
	from
		product_tb) tpt
where
	not stock_status = '부족';
    
/*
	like 연산자(와일드카드 %, _)
*/
-- like '%' => 포함
select
	*
from
	product_tb
where
	product_name like '%노트북';
    
select
	*
from
	product_tb
where
	product_name like '강력한%';
    
select
	*
from
	product_tb
where
	product_name like '%한%상';
    
-- like '_' => 특정 글자의 갯수 
select
	*
from
	product_tb
where
	product_name like '____책상';
    
    
select
	supplier_name
from
	supplier_tb
where
	supplier_name like '%이'
    or supplier_name like '%김';
    
select
	*
from
	supplier_tb
where
	supplier_name in ('양김','유한회사 이');
    
-- 서브쿼리로 in - like 
select
	supplier_name
from
	supplier_tb
where
	supplier_name in (
		select
			supplier_name
		from
			supplier_tb
		where
			supplier_name like '%이'
            or supplier_name like '%김');