select
    Genre,
    count(Genre) as Quantity
from {{ ref('stg_filter_table') }}
where Genre != 'N/A'
group by Genre
order by Quantity desc
