-- Recreate the vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Count the number of vine members in initial dataset.
SELECT * FROM vine_table WHERE vine = 'Y';

-- Count the number of non-vine members in initial dataset.
SELECT count(*) FROM vine_table WHERE vine = 'N';

-- Count the number of 5-star reviews from non-vine members.
SELECT
	count(*)
FROM
	(SELECT
		* 
	FROM 
		vine_table
	WHERE
		total_votes >= 20) as helpful_reviews
WHERE
	CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5
AND
	vine = 'N'
AND
	star_rating = 5;
	
-- Count the number of 5-star reviews from non-vine members.
SELECT
	count(*)
FROM
	(SELECT
		* 
	FROM 
		vine_table
	WHERE
		total_votes >= 20) as helpful_reviews
WHERE
	CAST(helpful_votes AS FLOAT)/CAST(total_votes AS FLOAT) >=0.5
AND
	vine = 'Y'
AND
	star_rating = 5;