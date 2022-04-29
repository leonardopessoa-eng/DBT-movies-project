{% set all_genres = ["Family", "Sport", "Biography", "Drama", "Comedy",
                    "Romance", "Animation", "Action", "Documentary",
                    "Short", "Game-show", "Reality-TV", "Adventure",
                    "Fantasy", "Sci-Fi", "Mystery", "Crime"] %}

{% for genres in all_genres %}

select '{{genres}}' as Individual_Genre {% if not loop.last %} union all {% endif %}

{% endfor %}
    
