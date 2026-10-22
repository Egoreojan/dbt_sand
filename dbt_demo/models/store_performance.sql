select
    os.storeid,
    sum(ofcat.revenue) as actual_sales,
    sum(st.sales_target) as target_sales
from 
    {{ ref('orders__stg') }} os
join
    {{ ref('orders__fact') }} ofcat on os.orderid = ofcat.orderid
join
    {{ ref('sales_targets') }} st on st.StoreId = os.storeid
group by 1