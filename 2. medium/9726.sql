/*

https://platform.stratascratch.com/coding/9726-classify-business-type?

Classify Business Type

Classify each business as either a restaurant, cafe, school, or other. A restaurant should have the word 'restaurant' in the business name. For cafes, either 'cafe', 'café', or 'coffee' can be in the business name. 'School' should be in the business name for schools. All other businesses should be classified as 'other'. Output the business name and the calculated classification.

Table: sf_restaurant_health_violations

sf_restaurant_health_violations

business_id int
business_name varchar
business_address varchar
business_city varchar
business_state varchar
business_postal_code float
business_latitude float
business_longitude float
business_location varchar
business_phone_number float
inspection_idv archar
inspection_date datetime
inspection_score float
inspection_type varchar
violation_id varchar
violation_description varchar
risk_category varchar

*/

SELECT DISTINCT business_name,
CASE
WHEN business_name REGEXP 'restaurant' THEN 'Restaurant'
WHEN business_name REGEXP 'cafe|café|coffee' THEN 'Cafe'
WHEN business_name REGEXP 'school' THEN 'School'
ELSE 'Other'
END
FROM sf_restaurant_health_violations;