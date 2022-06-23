# Movie Recommendation Database -- ETL Project

## Team Members:
* Ali Saghafi
* Laurane Gerber
* Scott Dutton
* Vasanta Prayaga
* Yuntian Xue

## Project Overview: 
In this project, we worked with the movie dataset from Kaggle. With the basic ETL procedures: extract, transform, and load, we were able to create our own movie database in PostgreSQL. Through queries to the database, we then did some data analysis, plotting and drew some conclusions. 
With the movies database we created, we are able to make recommendations based on their ratings and genre. 

## Resources:

Data Source:
* [movies_metadata.csv](https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=movies_metadata.csv)
* [ratings_small.csv](https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=ratings_small.csv)
* [links_small.csv](https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=links_small.csv)

Tools: 
- Python, Pandas, SQLAlchemy, Jupyter Notebook, PostgreSQL, pgAdmin 4

## Guidance:
All ETL code were in the [ETL.ipynb](ETL.ipynb) file. SQL code are in [Sql scripts](Resources/Sql%20scripts) folder. CSV tables can be also found in [Resources](Resources) folder. 

## Results:

### Extract data from csv
* We extracted data from movies_metadata.csv, ratings_small.csv and links_small.csv and stored in three dataframes: ```movies_metadata_df```, ```links_small_df``` and ```ratings_small_df``` by pandas. 
<br/>

### Clean and transform movies_metadata dataframe
* We checked the columns of ```movies_metadata_df``` and created a ```movies_df``` with the following columns: 
```
"id", "imdb_id", "title", "release_date", "budget", "revenue", "vote_average"
```
* We created a ```movies_genre_df``` with the following columns: 
```
"id", "imdb_id", "genres", "title", "release_date", "budget", "revenue", "vote_average"
```

* We created a dataframe ```profit_df``` to calculate the profit of each movie by substract the "revenue" column by "budget" column. 

* In terms of cleaning each dataframe, we dropped all NA values by ```.dropna()``` function, removed all duplicate rows by ```.drop_duplicates()```. We changed the type of "id" column to integer using ```.astype(int)``` and reformatted the imdb_id to match the links dataframe.
* The "genres" column was formatted in json, but instead of double quotation mark, the original dataset used single quotation mark. Thus, we replaced all single quotation to double quotation by ```.str.replace("'", '"') ```
* We then can extract all dictionaries in "genre" column using ```json.loads()```, and iterate rows to store information into list. The final list was transformed to dataframe and the name was ```genre_list_df```. In this way, we can easily get the genre information of each movie by referencing its movie_id. 

<br/>

### Clean and transform the ratings_small dataframe
* We created a ```ratings_df``` by only keeping the following columns in the ```ratings_small_df```:
```
"userId", "movieId", "rating"
```
* We performed similar data cleaning procedures as described in the previous section.

<br/>

### Clean and transform the links_small dataframe
* We created a ```links_df``` and performed similar data cleaning procedures as described in the previous section.

<br/>

### Load the data to a PostgreSQL Movie Database
Next, we loaded our data into the local Postgres database. 
* We created an engine using ```create_engine()``` and enter the username and password through a config.py file, which was ignored for security purposes. The engine would connect to a local databased created in pgAdmin4 called ```movies_db```. In the database we have five tables: `profit_table`, `movies`, `genre`, `ratings`, `links` .
* We then load dataframes to our database by ```.to_sql()``` function, the following dataframes were loaded: ```movies_df```, ```genre_list_df```, ```ratings_df```, ```links_df``` and ```profit_df```.

<br/>

### Database queries and data analysis
With pandas we were able to query from the database and do some analysis. The function we used was ```pd.read_sql_query()```. We did the following analysis:
* Query the database to get movie titles and their genres:
<p align="center">
  <img src="Resources/Screenshot images/table1_movies title and genre.png"> 
</p>

* Query and list movies in specific genre, for example, 10 comedy movies:
<p align="center">
  <img src="Resources/Screenshot images/table2_comedy.png"> 
</p>

* Query top rating movies with the highest rating score (5):
<p align="center">
  <img src="Resources/Screenshot images/table3_rating5.png"> 
</p>

* Query 10 Action movies with the highest rating score (5):
<p align="center">
  <img src="Resources/Screenshot images/table4_rating5action.png"> 
</p>

* Plot the histogram of movies based on their ratings and see the distribution:
<p align="center">
  <img src="Resources/Plot Images/movies with rating 4 or greater.png"> 
</p>

* Plot to show movie title, genre and ratings:
<p align="center">
  <img src="Resources/Plot Images/title, genre,rating.png"> 
</p>

* Query top 10 most profitable movies and their average ratings:
<p align="center">
  <img src="Resources/Screenshot images/table5_most_profitable_movies.png"> 
</p>
<br/>
