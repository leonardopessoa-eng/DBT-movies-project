{%- set all_genres = ["Family", "Sport", "Biography", "Drama", "Comedy",
                    "Romance", "Animation", "Action", "Documentary",
                    "Short", "Game", "Reality", "Adventure",
                    "Family", "Fantasy", "Sci", "Mystery", "Crime"] -%}

with organized as (

    select * from {{ ref('stg_genre_organized') }} 

),

genre_quantity as (

    select
        Genre,
        {% for genres in all_genres -%}
        (case when Genre like '%{{ genres }}%' then 1*Quantity else 0 end) as {{ genres }}_Quantity
        {%- if not loop.last -%}
            ,
        {%- endif %}
        {% endfor %}

    from organized

)

select * from genre_quantity
