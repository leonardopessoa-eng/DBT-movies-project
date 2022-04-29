{%- set all_genres = ["Family", "Sport", "Biography", "Drama", "Comedy",
                    "Romance", "Animation", "Action", "Documentary",
                    "Short", "Game", "Reality", "Adventure",
                    "Family", "Fantasy", "Sci", "Mystery", "Crime"] -%}

with organized as (

    select * from {{ ref('int_genre_quantity') }}
    -- int_genre_quantity PREVIEW OK, MAS NO DBT RUN INDICA ERRO!!!
    -- QUANDO ENDENDER O ERRO, VERIFICAR SE ESTE CÓDIGO ESTÁ OK.

),

genre_quantity_final as (

    {%- for genres in all_genres %}
        
        select

            '{{ genres }}' as Individual_Genre,
            sum ({{ genres }}_Quantity) as soma       
        
        from organized
        
        {% if not loop.last %}
            union all
        {% endif %}
        

    {%- endfor -%}

    

)

select * from genre_quantity_final