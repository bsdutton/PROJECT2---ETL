-- Table: public.ratings

-- DROP TABLE IF EXISTS public.ratings;

CREATE TABLE IF NOT EXISTS public.ratings
(
    "userId" bigint,
    "movieId" bigint,
    rating double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ratings
    OWNER to postgres;
	
select * from ratings
select movies.title, ratings.rating
from movies, ratings
where movies.id in ratings.movieId
order by ratings.rating desc limit 10