
with genre_organized as (

    select

        Genre,
        count(Genre) as Quantity

    from {{ ref('stg_filter_table') }}
    where Genre != 'N/A'
    group by Genre

)    

select * from genre_organized
--order by Quantity desc
