-- 1. The table us_counties_2010 contains 3,143 rows, and us_counties_2000
-- has 3,141. That reflects the ongoing adjustments to county-level geographies that typically result from government decision making. Using appropriate joins and the NULL value, identify which counties don’t exist in both
-- tables. For fun, search online to find out why they’re missing.

select us_counties_2010.geo_name, us_counties_2010.state_us_abbreviation, 
	us_counties_2000.geo_name 
from us_counties_2010 FULL JOIN us_counties_2000
ON us_counties_2010.state_fips = us_counties_2000.state_fips
and us_counties_2010.county_fips = us_counties_2000.county_fips
where us_counties_2000.geo_name IS NULL;


-- 2. Using either the median() or percentile_cont() functions in Chapter 5,
-- determine the median of the percent change in county population.
select u2010.geo_name, u2010.state_us_abbreviation, 
u2010.population_count_100_percent AS pop2010,
u2000.p0010001 AS pop2000,
round(cast(u2010.population_count_100_percent as numeric(8,2)) - u2000.p0010001) / u2000.p0010001 * 100, 1)
from us_counties_2010 AS u2010 JOIN us_counties_2000 AS u2000
ON u2010.county_fips = u2000.county_fips
AND u2010.state_fips = u2000.state_fips

select
percentile_cont(0.25) within group (order by housing_unit_count_100_percent asc) as percentile_25,
percentile_cont(0.50) within group (order by housing_unit_count_100_percent asc) as percentile_25
from us_counties_2010


SELECT c2010.geo_name,
 c2010.state_us_abbreviation AS state,
 c2010.p0010001 AS pop_2010,
 c2000.p0010001 AS pop_2000,
 c2010.p0010001 - c2000.p0010001 AS raw_change,
 round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
 / c2000.p0010001 * 100, 2 ) AS pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
 ON c2010.state_fips = c2000.state_fips
 AND c2010.county_fips = c2000.county_fips
 AND c2010.p0010001 <> c2000.p0010001
 ORDER BY pct_change DESC;
 

SELECT percentile_cont(.5)
WITHIN GROUP (ORDER BY round( (CAST(c2010.p0010001 AS numeric(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 )) AS percentile_50th
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips;



-- 3. Which county had the greatest percentage loss of population between
-- 2000 and 2010? Do you have any idea why? (Hint: A major weather
-- event happened in 2005.)


--St. Bernard Parish, due to a Hurricane.

SELECT c2010.geo_name,
       c2010.state_us_abbreviation,
       c2010.p0010001 AS pop_2010,
       c2000.p0010001 AS pop_2000,
       c2010.p0010001 - c2000.p0010001 AS raw_change,
       round( (CAST(c2010.p0010001 AS DECIMAL(8,1)) - c2000.p0010001)
           / c2000.p0010001 * 100, 1 ) AS pct_change
FROM us_counties_2010 c2010 INNER JOIN us_counties_2000 c2000
ON c2010.state_fips = c2000.state_fips
   AND c2010.county_fips = c2000.county_fips
ORDER BY pct_change ASC;