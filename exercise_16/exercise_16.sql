-- return the title, description, release year and list of actors returned as a JSON blob
-- for the movie Airplane Sierra
SELECT
    film.title,
    film.description,
    film.release_year,

    COALESCE (
        json_agg(to_jsonb(actor)) FILTER (
            WHERE
                actor IS NOT NULL
        )
    ) as actors
from
    film
    inner join film_actor on film.film_id = film_actor.film_id
    inner join actor on film_actor.actor_id = actor.actor_id
where
    film.title = 'Airplane Sierra'
group by
    film.title,
    film.description,
    film.release_year