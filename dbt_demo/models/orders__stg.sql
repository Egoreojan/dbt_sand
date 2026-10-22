select
    orderid,
    orderdate,
    customerid,
    employeeid,
    storeid::int,
    status as statusCD,
    case
      when (status = '01') then 'In Progress'
      when (status = '02') then 'Complited'
      when (status ='03' ) then 'Cancelled'
      else null
    end AS StatusDesc,
    updated_at
from 
  {{ source('landing', 'ordr') }}