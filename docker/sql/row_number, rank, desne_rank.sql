/*
	row_number() over()
    : 동일한 값이 있더라도 동일한 순서로 취급하지 않고 순서대로 숫자를 부여
	- 행의 갯수를 출력
    
    -row_number() over(partition by)
    : 그룹핑 된 데이터 내에서도 별도의 파티션으로 나눠 순위를 매김
    
    rank
    : 동일한 값이 있으면 동일한 순위를 매깁니다.
    - 순위 측정
*/
-- row_number() over()
select
	row_number() over(order by bt.brand_id, pt.product_name) as `number`,
	bt.brand_id,
    bt.brand_name,
    pt.product_name
from
	brand_tb bt
    inner join product_tb pt on (pt.brand_id = bt.brand_id)
group by
	brand_id,
    pt.product_name
order by
	brand_id;

-- row_number() over (partition by max()), 서브쿼리
select
	*
from
	(select
		row_number() over(partition by bt.brand_id order by bt.brand_id, min(pt.price)) as `number`,
		bt.brand_id,
		bt.brand_name,
		pt.product_name,
		min(pt.price) as min_price
	from
		brand_tb bt
		inner join product_tb pt on (pt.brand_id = bt.brand_id)
	group by
		brand_id,
		pt.product_name) tbt
where
	tbt.number < 6;
    
-- rank ( rank() , dense_rank() )
select
	rank() over(partition by bt.brand_name order by bt.brand_id, max(stock)) as `Rank`,
    bt.brand_name,
    pt.product_name,
    max(stock) as Max_stock
from
	brand_tb bt
    inner join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	bt.brand_id,
	product_name;
    
select
	dense_rank() over(partition by bt.brand_name order by bt.brand_id, max(stock)) as `Rank`,
    bt.brand_name,
    pt.product_name,
    max(stock) as Max_stock
from
	brand_tb bt
    inner join product_tb pt on(pt.brand_id = bt.brand_id)
group by
	bt.brand_id,
	product_name;