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


-- Number of reviews bu a customer with 2 or more reviews as well as their average rating --
select
	car.customer_id, ct.customer_count, car.avg_rating
from
	(select rt.customer_id, round(avg(vt.star_rating), 1) as avg_rating
	from review_id_table as rt
	join vine_table as vt
	on rt.review_id = vt.review_id
	group by rt.customer_id) as car
join
	customers_table as ct
on
	car.customer_id = ct.customer_id
where
	ct.customer_count >= 2
order by
	car.avg_rating desc, ct.customer_count desc;

-- Number of reviews by a customer with only 1 as well as their average rating --
select
	car.customer_id, ct.customer_count, car.avg_rating
from
	(select rt.customer_id, round(avg(vt.star_rating), 0) as avg_rating
	from review_id_table as rt
	join vine_table as vt
	on rt.review_id = vt.review_id
	group by rt.customer_id) as car
join
	customers_table as ct
on
	car.customer_id = ct.customer_id
where
	ct.customer_count = 1
order by
	car.avg_rating desc, ct.customer_count desc;