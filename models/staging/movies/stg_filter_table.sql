
select 
    *
from {{source('movies','filmes')}}
where Title IS NOT NULL 
      and 
      Year IS NOT NULL
      and 
      Genre IS NOT NULL







