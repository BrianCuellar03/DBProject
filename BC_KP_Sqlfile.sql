USE comp373;
SHOW TABLES;

-- Drop the table if it already exists
DROP TABLE IF EXISTS BC_KP_DatabaseProject;

-- Create the table with columns matching your CSV headers
CREATE TABLE BC_KP_DatabaseProject (
    Unnamed_0 INT,
    id INT,
    title VARCHAR(255),
    release_date DATE,
    genres TEXT,
    original_language VARCHAR(10),
    vote_average DECIMAL(3,1),
    vote_count INT,
    popularity DECIMAL(5,2),
    overview TEXT,
    budget BIGINT,
    production_companies TEXT,
    revenue BIGINT,
    runtime INT,
    tagline TEXT
);

-- This chunk of code loads the clean csv into Professor Ciancis database COMP373. 
-- Were creating a table inside of comp 373. 
LOAD DATA LOCAL INFILE '/Users/briancuellar/Desktop/DatabaseesProject/top_1000_popular_movies_tmdb_clean.csv'
INTO TABLE BC_KP_DatabaseProject
FIELDS TERMINATED BY ',' 
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Unnamed_0, id, title, release_date, genres, original_language, vote_average, vote_count, popularity, overview, budget, production_companies, revenue, runtime, tagline);

-- Figured out we dont want first two columns so its cleaner
ALTER TABLE BC_KP_DatabaseProject
  DROP COLUMN Unnamed_0,
  DROP COLUMN id;