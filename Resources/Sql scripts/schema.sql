-- Create tables for raw data to be loaded into
Drop table movies CASCADE
CREATE TABLE movies (
id INT PRIMARY KEY,
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
movie_id INT ,
genre TEXT,
foreign key(movie_id) references movies(id) 
);
Drop table ratings
CREATE TABLE ratings (
userId INT ,
movieId INT ,
rating FLOAT,
PRIMARY KEY(userId, movieId),
foreign key(movieId) references movies(id)
);
Drop table links
CREATE TABLE links (
linkId INT PRIMARY KEY,
imdbId VARCHAR,
tmdbId INT,
foreign key(tmdbId) references movies(id)
);

select * from movies;
select * from genre;
select * from ratings;
select * from links;