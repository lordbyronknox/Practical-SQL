--do it yourself pg 89/54

--1.
-- Write a WITH statement to include with COPY to handle the import of an
-- imaginary text file whose first couple of rows look like this:
-- id:movie:actor
-- 50:#Mission: Impossible#:Tom Cruise

COPY movies (id, movie, actor)
FROM 'C:\Users\byron\SQL\analysis\chap 4\movies.csv' 
WITH (FORMAT CSV, HEADER);


-- 2.
-- Using the table us_counties_2010 you created and filled in this chapter,
-- export to a CSV file the 20 counties in the United States that have the most
-- housing units. Make sure you export only each county’s name, state, and
-- number of housing units. (Hint: Housing units are totaled for each county
-- in the column housing_unit_count_100_percent.)

COPY (
 select distinct geo_name, state_us_abbreviation, housing_unit_count_100_percent 
 from us_counties_2010
order by housing_unit_count_100_percent desc
limit 20
 )
TO 'C:\Users\byron\SQL\Try it yourself\analysis\us_counties_top20.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');


-- Imagine you’re importing a file that contains a column with these values:
--	17519.668
--	20084.461
--	18976.335
-- Will a column in your target table with data type numeric(3,8) work
-- for these values? Why or why not?
create table num_values (nums numeric(3,8))

insert into num_values (nums)
values (17519.668), 
		(20084.461), 
		(18976.335)
		
--cannot have a numeric(3.8)
--ERROR:  NUMERIC scale 8 must be between 0 and precision 3
--LINE 1: create table num_values (nums numeric(3,8))



