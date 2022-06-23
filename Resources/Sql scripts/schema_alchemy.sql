-- Table: public.movies

-- DROP TABLE IF EXISTS public.movies;

CREATE TABLE IF NOT EXISTS public.movies
(
    id integer,
    imdb_id text COLLATE pg_catalog."default",
    title text COLLATE pg_catalog."default",
    release_date text COLLATE pg_catalog."default",
    budget bigint,
    revenue double precision,
    vote_average double precision
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.movies
    OWNER to postgres;


-- Table: public.genre

-- DROP TABLE IF EXISTS public.genre;

CREATE TABLE IF NOT EXISTS public.genre
(
    "genreId" bigint,
    movie_id bigint,
    genre text COLLATE pg_catalog."default"
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.genre
    OWNER to postgres;


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
	
	
	-- Table: public.links

-- DROP TABLE IF EXISTS public.links;

CREATE TABLE IF NOT EXISTS public.links
(
    "movieId" bigint,
    "imdbId" bigint,
    "tmdbId" bigint
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.links
    OWNER to postgres;