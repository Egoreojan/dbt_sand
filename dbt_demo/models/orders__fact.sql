select
    o.orderid,
    o.orderdate,
    o.customerid,
    o.employeeid,
    o.storeid,
    o.statusCD,
    o.StatusDesc,
    o.updated_at,
    count(distinct o.orderid) as ordercount,
    sum(oi.total_price) as revenue
from 
    {{ ref('orders__stg') }} o
join
    {{ ref('order_items__stg') }} oi on o.OrderID = oi.ORDERID
group by
    o.orderid,
    o.orderdate,
    o.CustomerId,
    o.EmployeeId,
    o.StoreId,
    o.statusCD,
    o.StatusDesc,
    o.updated_at