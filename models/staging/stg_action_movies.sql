
select
    int64_field_0,
    Title,
    Year,
    Genre,
    Director,
    Writer,
    Actors,
    imdbRating,
    imdbVotes,
    Season,
    Episode
from {{ ref('stg_filter_table') }}
where Genre like '%Action%'
      and
      imdbRating != 'N/A'
      and
      imdbVotes != 'N/A'      
      and
      cast(imdbRating as float64) > 7.0
      and    
      cast(replace(imdbVotes, ',', '') as float64) > 100  

