

/*To get the county with the highest sales */
with country_ranks as (
select 
		cus.customerID,
		cus.customerName,
		cus.country,
		ord.ordertotal,
		DENSE_RANK() over(partition by country order by ordertotal desc) as Country_rank
from dbo.Customers as cus
join dbo.Orders as ord
on 
cus.CustomerID = ord.CustomerID
)
select * from country_ranks
where Country_rank = 1