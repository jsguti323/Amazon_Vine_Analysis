# Amazon Vine Analysis

## Overview
The orignal goal of this analysis was to determine if there was any bias toward favorable reviews from Vine members in your dataset. That is, does being a member of the Amazon Vine program impact the liklihood of a customer leaving a 5 star review or not; however, after reviewing the dataset, I decided to go in a different direction due to the limitations of the data. I decided to analyze a dataset that featured Amazon book reviews, but although the dataset had over 2 million entries, only 2 reviews were made by Amazon Vine members. This is would not elicit findings of statistical significance, so I adjusted my research and looked at a few other features of interest, such as average star ratings of customers with more than 1 reviews, average star ratings of customers with only 1 reviews, and number of star ratings sorted by whether or not the review was a verified purchase.

## Results
Data Source: https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Books_v1_02.tsv.gz

We began the analysis by extracting the data from the Amazon Reviews datasets page, transforming it, and loading it into a PostgreSQL Database hosted on AWS. The following is a snippet of the final, cleaned tables in the database:

#### Customers Table

![Customers_Table](https://user-images.githubusercontent.com/99751636/189719051-d19f9be9-92a4-4794-8550-9a7a44907d8e.png)


#### Prodcucts Table

![Product_Table](https://user-images.githubusercontent.com/99751636/189719204-757a7dde-5088-4fae-accd-38cd2fda4cea.png)


#### Review ID Table

![Review_Table](https://user-images.githubusercontent.com/99751636/189719270-70b341e7-58dc-4840-ac14-c1849378c46a.png)


#### Vine Table

![Vine_Table](https://user-images.githubusercontent.com/99751636/189719298-26e8d066-9d98-45b2-b558-8a29d485089a.png)


### Number of Vine Member Reviews vs Non-Vine Member Reviews

![Vine_Members](https://user-images.githubusercontent.com/99751636/189721685-f15ba0ae-0abb-437a-90cd-1f20b36d28ae.png)

* Of the 2.3 million + reviews, only 2 of them were reviews by Amazon Vine Members.
* Finding the number of 5 star reviews by vine and non-vine memebers would be irrelevant with this small of a sample size.


### Verified Purchases vs Non-verified Purchases
![Verified_Purchases](https://user-images.githubusercontent.com/99751636/189722023-7f67e463-e4ab-4cc0-9786-ed43f9f8ff48.png)

* Next, we analyzed if there was a difference in review ratings when we look at verified vs non-verified purchases.
* Significantly more reviews are from non-verified purchases.
* The distribution of the two groups, however, appear the same: Mostly 5 star ratings, followed by 4 stars, with 3 star, 2 star, and 1 star reviews all being nearly identifcal.


### Reviews by Customers with Only 1 Review

![One_Review_Ratings](https://user-images.githubusercontent.com/99751636/189722746-f2f1bc3c-72e4-4253-8383-319d5c0dd631.png)

* Check to see if customers who only leave one result tend to leave negative or positive reviews


### Reviews by Custoemrs with More than One Review

![Review_Ratings](https://user-images.githubusercontent.com/99751636/189722930-60e32ade-c23d-4805-af1c-3d3a78ed09dd.png)


