select
    orderid
from
    {{ ref('orders__fact') }}
where revenue < 0