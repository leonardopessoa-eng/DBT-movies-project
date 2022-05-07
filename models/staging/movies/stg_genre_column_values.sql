
{% set genres = dbt_utils.get_column_values(table = ref('stg_genre_organized'), column = 'Genre') %}

{%- for genre in genres %}
    
    select

        '{{ genre }}' as Individual
    
    from {{ ref('stg_genre_organized') }}

    {% if not loop.last %}
        union all
    {% endif %} 

{%- endfor -%}