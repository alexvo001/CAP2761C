-- This command is for looking at the whole table. - Using "*"
-- select * from TSQLV6.Sales.Orders

-- This command is for looking at part of table. - COLUMN NAMES
select orderid, custid, empid, orderdate, freight
from TSQLV6.Sales.Orders

-- This command is for looking at some rows (customer id = 71) - WHERE clause
select orderid,custid, empid, orderdate, freight
from TSQLV6.Sales.Orders
where custid = 71

-- GROUP BY - arrange the previous receive rows in groups
-- to apply "aggregate functions": COUNT(), SUM(), AVG(), MIN(), MAX()
-- grouped by empid 
select empid, year(orderdate) as [Order Year]
from TSQLV6.Sales.Orders
where custid = 71
group by empid, year(orderdate)

select empid, year(orderdate) as [Order Year]
from TSQLV6.Sales.Orders
where custid = 71
group by year(orderdate), empid

-- Applying COUNT() for any rows
select empid, year(orderdate) as [Order Year]--, count(*) as [Number of Orders]
from TSQLV6.Sales.Orders
where custid = 71
group by empid, year(orderdate)

-- Applying COUNT () for distinct Customer ID
select empid, year(orderdate) as [Order Year], count(distinct custid) as [Number of Orders]
from TSQLV6.Sales.Orders
group by empid, year(orderdate)

-- Applying HAVING clause to retrieve only a selected quantity
select empid, year(orderdate) as [Order Year], count(distinct custid) as [Number of Orders]
from TSQLV6.Sales.Orders
group by empid, year(orderdate)
having count(distinct custid) > 20