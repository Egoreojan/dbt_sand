select
    os.customerid,
    c.customername,
    sum(os.ordercount) as order_count,
    sum(os.revenue) as revenue
from
    {{ ref('orders__fact') }} os
join
    {{ ref('customers__stg') }} c on os.customerid = c.customerid
group by
    os.customerId,
    c.customerName