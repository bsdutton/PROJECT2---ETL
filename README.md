# Movie Recommendation Database
**ETL Project**

## Team Members:
* Ali Saghafi
* Laurane Gerber
* Scott Dutton
* Vasanta Prayaga
* Yuntian Xue

## Project Overview: 
In this project, we worked with the movie dataset from Kaggle. With the basic ETL procedures: extract, transform, and load, we were able to create our own movie database in PostgreSQL. Through queries to the database, we then did some data analysis, plotting and drew some conclusions. 

## Resources:

Data Source:
* [movies_metadata.csv](https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=movies_metadata.csv)
* [ratings_small.csv](https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=ratings_small.csv)
* [links_small.csv](https://www.kaggle.com/datasets/rounakbanik/the-movies-dataset?select=links_small.csv)

Tools: 
- Python, Pandas, SQLAlchemy, Jupyter Notebook, PostgreSQL, pgAdmin 4

## Results

### Extract data from csv
* We extracted data from movies_metadata.csv, ratings_small.csv and links_small.csv and stored in three dataframes: ```movies_metadata_df```, ```links_small_df``` and ```ratings_small_df``` by pandas. 
<br/>

### Clean and transform movies_matadata dataframe
* We checked the columns of ```movies_metadata_df``` and created a ```movies_df``` with the following columns: 
```
"id", "imdb_id", "title", "release_date", "budget", "revenue", "vote_average"
```
* And we created a ```movies_genre_df``` with the following columns: 
```
"id", "imdb_id", "genres", "title", "release_date", "budget", "revenue", "vote_average"
```
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
* We created an engine using ```create_engine()``` and enter the username and password through a config.py file, which was ignored for security purposes. The engine would connect to a local databased created in pgAdmin4 called ```movies_db```.
* We then load dataframes to our database by ```.to_sql()``` function, the following dataframes were loaded: ```movies_df```, ```genre_list_df```, ```ratings_df``` and ```links_df```.

### Database queries and data analysis
Using pandas we were able to query from the database we created and do some analysis. The function we used was ```pd.read_sql_query()```. We did the following analysis:
* Query the database to get movie titles and their genres:




<p align="center">
  <img src="https://user-images.githubusercontent.com/68669675/93714176-9c6dec00-fb26-11ea-976c-c7d21e2fee0b.png"> 
</p>
<p align="center">
  <img src="https://user-images.githubusercontent.com/68669675/93714179-9d9f1900-fb26-11ea-815d-d14fee9755a4.png"> 
</p>
<br/>
