-- 1. Write a SQL statement for calculating the area of a circle whose radius is
-- 5 inches. (If you don’t remember the formula, it’s an easy web search.) Do
-- you need parentheses in your calculation? Why or why not?

select (5 ^ 2) * 3.14
--answer: 78.54inch / 199.49cm



-- Using the 2010 Census county data, find out which New York state county
-- has the highest percentage of the population that identified as “American
-- Indian/Alaska Native Alone.” What can you learn about that county from
-- online research that explains the relatively large proportion of American
-- Indian population compared with other New York counties?


select geo_name, 
		p0010005 as American_Indian, 
		population_count_100_percent,
		(CAST (p0010005 as numeric(8,0)) / population_count_100_percent)*100 as percentage
FROM us_counties_2010
where state_us_abbreviation ilike '%ny%'
order by percentage desc


-- Was the 2010 median county population higher in California or New York?
--CALIFORNIA
SELECT state_us_abbreviation, percentile_cont(0.5)
WITHIN GROUP (ORDER BY p0010001) AS Median
FROM us_counties_2010
WHERE state_us_abbreviation IN ('NY', 'CA')
GROUP BY state_us_abbreviation;

