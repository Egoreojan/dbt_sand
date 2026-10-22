select
    os.storeid,
    sum(ofact.revenue) as actual_sales
from
    {{ ref('orders__stg') }} os
join 
    {{ ref('orders__fact') }} ofact on (os.orderid = ofact.orderid)
group by 1