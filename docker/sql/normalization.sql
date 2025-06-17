select * from sample_products_tb;
/*
	정규화(=normalization) -> 중복제거
    1. distinct(행의 조합 데이터가 동일한 행을 제거해줌)
    2. group by(select절과 상관없이 group by절에서 컬럼을 선택하여 중복 제거)
    
    select 실행(해석) 순서
    1. 	from	 -> 데이터가 존재하는 테이블을 조회하거나 조인을 하는 역할
    2. 	on		 -> 조인이 있는 경우 조인 조건을 평가
    3. 	join	 -> on 조건에 해당하는 데이터를 결합하는 역할
    4. 	where	 -> from 에서 조회할 데이터의 조건을 평가하는 역할
    5. 	group by -> 조회된 결과에서 명시된 컬럼끼리 그룹핑을 하는 역할
    6. 	having	 -> 그룹핑된 결과에서 데이터의 조건을 평가
    7. 	select	 -> 최종 출력할 컬럼을 선택하는 역할
    8. 	distinct -> select 에서 선택한 컬럼의 조합결과에서 중복 행 제거
    9. 	order by -> 최종 select 결과를 오름차순(ASC(=default)) 또는 내림차순(DESC)으로 정렬하는 역할
    10.	limit	 -> 최종 select 결과의 행 개수를 제한할 수 있음
*/
-- 1. distinct 방법
select
	distinct
	category_name
from
	sample_products_tb
order by
	category_name;

-- 2. group by 방법
-- 2.1 select 절에 * 를 쓸 수가 없음
select
	*
from
	sample_products_tb
group by
	category_name
order by
	category_name;
    
insert into category_tb
select
	category_name,
    count(category_name)	-- count()는 select절에서 명시가 되지만 group by 절이 실행될 때 같이 실행됨.
from
	sample_products_tb
group by
	category_name
order by
	category_name;

-- category_tb 삽입 방법
-- 1. select 절에 default는 넣을 수 가 없음 = 0 을 넣음
insert into category_tb
select
	0,
	category_name
from
	sample_products_tb
group by
	category_name
order by
	category_name;

-- 2. 또는 insert into 에서 category_name만 넣겠다는걸 명시
insert into category_tb(category_name)
select
	category_name
from
	sample_products_tb
group by
	category_name
order by
	category_name;
    
-- sample_product_tb 에서 brand_name을 brand_tb에 넣으세요.
insert into brand_tb(brand_name)
select
	brand_name
from
	sample_products_tb
group by
	brand_name
order by
	brand_name;
    
-- sample_product_tb 에서 supplier_name, supplier_phone을 supplier_tb에 넣으세요.
insert into supplier_tb(supplier_name, supplier_phone)
select
	supplier_name,
    supplier_phone
from
	sample_products_tb
group by
	supplier_name,
    supplier_phone
order by
	supplier_name,
    supplier_phone;
    
-- sample_product_tb 에서 product_name, category_id, brand_id, suplier_id, price, stock,을 출력(inner join(교집합))
select
	spt.product_name,
    ct.category_id,
    bt.brand_id,
    st.supplier_id,
    spt.price,
    spt.stock_quantity
from
	sample_products_tb spt
    inner join category_tb ct on(ct.category_name = spt.category_name)
    inner join brand_tb bt on(bt.brand_name = spt.brand_name)
    inner join supplier_tb st on(st.supplier_name = spt.supplier_name and st.supplier_phone = spt.supplier_phone)
order by
	spt.product_name;
    
-- product_tb 에 선택된 항목 삽입
-- select 이후 컬럼명이 중복이 없다면 참조하는 tb 즉, as 를 생략 가능
insert into product_tb
select
	0,
	spt.product_name,
    ct.category_id,
    bt.brand_id,
    st.supplier_id,
    spt.price,
    spt.stock_quantity
from
	sample_products_tb spt
    inner join category_tb ct on(ct.category_name = spt.category_name)
    inner join brand_tb bt on(bt.brand_name = spt.brand_name)
    inner join supplier_tb st on(st.supplier_name = spt.supplier_name and st.supplier_phone = spt.supplier_phone)
order by
	product_name,
    category_id,
    brand_id,
    supplier_id;
    
    