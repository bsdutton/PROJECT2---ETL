Drop table movies CASCADE
CREATE TABLE movies (
id BIGINT PRIMARY KEY,
imdb_id VARCHAR,
title TEXT,
release_date DATE,
budget INT,
revenue INT,
vote_average FLOAT
);
Drop table genre
CREATE TABLE genre(
genreId INT PRIMARY KEY,	
movie_id BIGINT ,
genre TEXT,
foreign key(movie_id) references movies(id)
);
Drop table ratings
CREATE TABLE ratings (
userId INT ,
movieId BIGINT ,
rating FLOAT,
PRIMARY KEY(movieId),
foreign key(movieId) references movies(id)
);
Drop table links
CREATE TABLE links (
linkId INT PRIMARY KEY,
imdbId VARCHAR,
tmdbId BIGINT,
foreign key(tmdbId) references movies(id)
);
select * from movies
select * from genre
select * from ratings
select * from links

select movies.title, ratings.rating
from movies, ratings
where movies.id = ratings.movieId
order by rating desc limit 10