
with best_action_and_drama as (

    select 
        *
    from {{ ref('stg_action_movies') }}
    union all
    select 
        *
    from {{ ref('stg_drama_movies') }}

),

quantity_rejection_approval as (

    select
        distinct(int64_field_0),
        Title,
        Year,
        Genre,
        round((round((cast(imdbRating as float64)/10),2)*cast(replace(imdbVotes, ',', '') as float64)),0) as approval_votes,
        cast(replace(imdbVotes, ',', '') as float64)-round((round((cast(imdbRating as float64)/10),2)*cast(replace(imdbVotes, ',', '') as float64)),0) as rejection_votes
    from best_action_and_drama
    order by approval_votes desc, Year desc, Title asc

)

select 
    * 
from quantity_rejection_approval 

