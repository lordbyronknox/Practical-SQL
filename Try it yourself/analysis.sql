CREATE TABLE char_data_types (
 varchar_column varchar(10),
 char_column char(10),
 text_column text
);

INSERT INTO char_data_types
VALUES
 ('abc', 'abc', 'abc'),
 ('defghi', 'defghi', 'defghi');
 
 select * from char_data_typres
 
 COPY char_data_types TO 'C:\Users\byron\SQL\Try it yourself\analysis\typetest.txt' WITH (FORMAT CSV, HEADER, DELIMITER '|');
 COPY teachers TO 'C:\Users\byron\SQL\Try it yourself\analysis\teacher.txt' WITH (FORMAT CSV, HEADER, DELIMITER '|');
 
 
 
 CREATE TABLE number_data_types (
 u numeric_column numeric(20,5),
 real_column real,
 double_column double precision
);
v INSERT INTO number_data_types
VALUES
 (.7, .7, .7),
 (2.13579, 2.13579, 2.13579),
 (2.1357987654, 2.1357987654, 2.1357987654);
 
 
 
 
 
 CREATE TABLE date_time_types (
 timestamp_column timestamp with time zone,
 interval_column interval
);

INSERT INTO date_time_types
VALUES
 ('2018-12-31 01:00 EST','2 days'),
 ('2018-12-31 01:00 -8','1 month'),
 ('2018-12-31 01:00 Australia/Melbourne','1 century'),
 (now(),'1 week');
 
 select * from date_time_types
 
 
 
 
SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM date_time_types;

SELECT numeric_column,
CAST(numeric_column AS integer),
CAST(numeric_column AS varchar(6))
FROM number_data_types; 
 
SELECT CAST(char_column AS integer) FROM char_data_types; --cant convert string to int.

SELECT timestamp_column, CAST(timestamp_column AS varchar(10))
FROM date_time_types;

SELECT timestamp_column::varchar(10)	--:: instead/alternative to CAST()
FROM date_time_types;





CREATE TABLE us_counties_2010 (
    geo_name varchar(90),                    -- Name of the geography
    state_us_abbreviation varchar(2),        -- State/U.S. abbreviation
    summary_level varchar(3),                -- Summary Level
    region smallint,                         -- Region
    division smallint,                       -- Division
    state_fips varchar(2),                   -- State FIPS code
    county_fips varchar(3),                  -- County code
    area_land bigint,                        -- Area (Land) in square meters
    area_water bigint,                        -- Area (Water) in square meters
    population_count_100_percent integer,    -- Population count (100%)
    housing_unit_count_100_percent integer,  -- Housing Unit count (100%)
    internal_point_lat numeric(10,7),        -- Internal point (latitude)
    internal_point_lon numeric(10,7),        -- Internal point (longitude)

    -- This section is referred to as P1. Race:
    p0010001 integer,   -- Total population
    p0010002 integer,   -- Population of one race:
    p0010003 integer,       -- White Alone
    p0010004 integer,       -- Black or African American alone
    p0010005 integer,       -- American Indian and Alaska Native alone
    p0010006 integer,       -- Asian alone
    p0010007 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0010008 integer,       -- Some Other Race alone
    p0010009 integer,   -- Population of two or more races
    p0010010 integer,   -- Population of two races:
    p0010011 integer,       -- White; Black or African American
    p0010012 integer,       -- White; American Indian and Alaska Native
    p0010013 integer,       -- White; Asian
    p0010014 integer,       -- White; Native Hawaiian and Other Pacific Islander
    p0010015 integer,       -- White; Some Other Race
    p0010016 integer,       -- Black or African American; American Indian and Alaska Native
    p0010017 integer,       -- Black or African American; Asian
    p0010018 integer,       -- Black or African American; Native Hawaiian and Other Pacific Islander
    p0010019 integer,       -- Black or African American; Some Other Race
    p0010020 integer,       -- American Indian and Alaska Native; Asian
    p0010021 integer,       -- American Indian and Alaska Native; Native Hawaiian and Other Pacific Islander
    p0010022 integer,       -- American Indian and Alaska Native; Some Other Race
    p0010023 integer,       -- Asian; Native Hawaiian and Other Pacific Islander
    p0010024 integer,       -- Asian; Some Other Race
    p0010025 integer,       -- Native Hawaiian and Other Pacific Islander; Some Other Race
    p0010026 integer,   -- Population of three races
    p0010047 integer,   -- Population of four races
    p0010063 integer,   -- Population of five races
    p0010070 integer,   -- Population of six races

    -- This section is referred to as P2. HISPANIC OR LATINO, AND NOT HISPANIC OR LATINO BY RACE
    p0020001 integer,   -- Total
    p0020002 integer,   -- Hispanic or Latino
    p0020003 integer,   -- Not Hispanic or Latino:
    p0020004 integer,   -- Population of one race:
    p0020005 integer,       -- White Alone
    p0020006 integer,       -- Black or African American alone
    p0020007 integer,       -- American Indian and Alaska Native alone
    p0020008 integer,       -- Asian alone
    p0020009 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0020010 integer,       -- Some Other Race alone
    p0020011 integer,   -- Two or More Races
    p0020012 integer,   -- Population of two races
    p0020028 integer,   -- Population of three races
    p0020049 integer,   -- Population of four races
    p0020065 integer,   -- Population of five races
    p0020072 integer,   -- Population of six races

    -- This section is referred to as P3. RACE FOR THE POPULATION 18 YEARS AND OVER
    p0030001 integer,   -- Total
    p0030002 integer,   -- Population of one race:
    p0030003 integer,       -- White alone
    p0030004 integer,       -- Black or African American alone
    p0030005 integer,       -- American Indian and Alaska Native alone
    p0030006 integer,       -- Asian alone
    p0030007 integer,       -- Native Hawaiian and Other Pacific Islander alone
    p0030008 integer,       -- Some Other Race alone
    p0030009 integer,   -- Two or More Races
    p0030010 integer,   -- Population of two races
    p0030026 integer,   -- Population of three races
    p0030047 integer,   -- Population of four races
    p0030063 integer,   -- Population of five races
    p0030070 integer,   -- Population of six races

    -- This section is referred to as P4. HISPANIC OR LATINO, AND NOT HISPANIC OR LATINO BY RACE
    -- FOR THE POPULATION 18 YEARS AND OVER
    p0040001 integer,   -- Total
    p0040002 integer,   -- Hispanic or Latino
    p0040003 integer,   -- Not Hispanic or Latino:
    p0040004 integer,   -- Population of one race:
    p0040005 integer,   -- White alone
    p0040006 integer,   -- Black or African American alone
    p0040007 integer,   -- American Indian and Alaska Native alone
    p0040008 integer,   -- Asian alone
    p0040009 integer,   -- Native Hawaiian and Other Pacific Islander alone
    p0040010 integer,   -- Some Other Race alone
    p0040011 integer,   -- Two or More Races
    p0040012 integer,   -- Population of two races
    p0040028 integer,   -- Population of three races
    p0040049 integer,   -- Population of four races
    p0040065 integer,   -- Population of five races
    p0040072 integer,   -- Population of six races

    -- This section is referred to as H1. OCCUPANCY STATUS
    h0010001 integer,   -- Total housing units
    h0010002 integer,   -- Occupied
    h0010003 integer    -- Vacant
);

--copy from file to table
COPY us_counties_2010 FROM 'C:\Users\byron\SQL\analysis\chap 4\us_counties_2010.csv' WITH (FORMAT CSV, HEADER);


				-----------------------------
				
CREATE TABLE us_counties_2000 (
 geo_name varchar(90),
 state_us_abbreviation varchar(2),
 state_fips varchar(2),
 county_fips varchar(3),
 p0010001 integer,
 p0010002 integer,
 p0010003 integer,
 p0010004 integer,
 p0010005 integer,
 p0010006 integer,
 p0010007 integer,
 p0010008 integer,
 p0010009 integer,
 p0010010 integer,
 p0020002 integer,
 p0020003 integer
);

COPY us_counties_2000
FROM 'C:\Users\byron\SQL\analysis\us_counties_2000.csv'
WITH (FORMAT CSV, HEADER);

			-----------------------------				

select us_counties_2010.geo_name, us_counties_2010.state_us_abbreviation, 
	us_counties_2000.geo_name 
from us_counties_2010 FULL JOIN us_counties_2000
ON us_counties_2010.state_fips = us_counties_2000.state_fips
and us_counties_2010.county_fips = us_counties_2000.county_fips
where us_counties_2000.geo_name IS NULL;
				

select * from us_counties_2010

SELECT geo_name, state_us_abbreviation, area_land
FROM us_counties_2010
ORDER BY area_land DESC
LIMIT 3;

SELECT geo_name, state_us_abbreviation, internal_point_lon
FROM us_counties_2010
ORDER BY internal_point_lon DESC
LIMIT 5;


--create table
CREATE TABLE supervisor_salaries (
    town varchar(30),
    county varchar(30),
    supervisor varchar(30),
    start_date date,
    salary money,
    benefits money
);

--import data from file
--need to stipulate the colums to insert into (town, etc)
\COPY supervisor_salaries (town, supervisor, salary) FROM 'C:\Users\byron\SQL\analysis\chap 4\supervisor_salaries.csv' WITH (FORMAT CSV, HEADER);

select * from supervisor_salaries

--deletes all data in table
DELETE FROM supervisor_salaries;

--create a temporary table
CREATE TEMPORARY TABLE supervisor_salaries_temp (LIKE supervisor_salaries);

--copy data into temp table (run this code from POSGRESQL, so remove the \)
COPY supervisor_salaries_temp (town, supervisor, salary) FROM 'C:\Users\byron\SQL\analysis\chap 4\supervisor_salaries.csv' WITH (FORMAT CSV, HEADER);

select * from supervisor_salaries_temp

--insert data into table, from temp table
INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Some County', supervisor, salary
FROM supervisor_salaries_temp;

drop table supervisor_salaries_temp;


---------------
--
--
INSERT INTO supervisor_salaries (town, county, supervisor, start_date, salary, benefits)
SELECT town, 'Some County', supervisor, '2021-01-01', salary, 10000
FROM supervisor_salaries_temp;

select * from supervisor_salaries;

drop table supervisor_salaries_temp;

---------------------------------------------------

--copy results of select query to txt file
COPY (
 SELECT geo_name, state_us_abbreviation
 FROM us_counties_2010
 WHERE geo_name ILIKE '%mill%'
 )
TO 'C:\Users\byron\SQL\Try it yourself\analysis\us_counties_mill_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');


--copy specific columns
COPY us_counties_2010 (geo_name, internal_point_lon)
TO 'C:\Users\byron\SQL\Try it yourself\analysis\us_counties_mill_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');

-----------------------------------------------
--import data using PostgreSQL
--right click on table, import/export, select import or export, 
--select the file to import from, header


-----------------------------------------------
-- + Addition
-- - Subtraction
-- * Multiplication
-- / Division (returns the quotient only, no remainder)
-- % Modulo (returns just the remainder)
-- ^ Exponentiation
-- |/ Square root
-- ||/ Cube root
-- ! Factorial


SELECT 2 + 2;
SELECT 9 - 1;
SELECT 3 * 4;
SELECT 11 / 6;
SELECT 11 % 6;
SELECT 11.0 / 6;
SELECT CAST (11 AS numeric(3,1))
SELECT CAST (11 AS numeric(3,1)) / 6;
SELECT 3 ^ 4;
SELECT |/ 10;
SELECT sqrt(10);
SELECT ||/ 10;
SELECT 4 !;
SELECT 7 + 8 * 9;
SELECT (7 + 8) * 9;
SELECT 3 ^ 3 - 1;
SELECT 3 ^ (3 - 1);

SELECT geo_name,
 state_us_abbreviation AS "st",
 p0010001 AS "Total Population",
 p0010003 AS "White Alone",
 p0010004 AS "Black or African American Alone",
 p0010005 AS "Am Indian/Alaska Native Alone",
 p0010006 AS "Asian Alone",
 p0010007 AS "Native Hawaiian and Other Pacific Islander Alone",
 p0010008 AS "Some Other Race Alone",
 p0010009 AS "Two or More Races"
FROM us_counties_2010;

SELECT geo_name,
 state_us_abbreviation AS "st",
 p0010003 AS "White Alone",
 p0010004 AS "Black Alone",
 p0010003 + p0010004 AS "Total White and Black"  --adding columns together
FROM us_counties_2010;


SELECT geo_name,
 state_us_abbreviation AS "st",
   p0010001 AS "Total",
   p0010003 + p0010004 + p0010005 + p0010006 + p0010007
   + p0010008 + p0010009 AS "All Races",
   (p0010003 + p0010004 + p0010005 + p0010006 + p0010007
   + p0010008 + p0010009) - p0010001 AS "Difference"
FROM us_counties_2010
ORDER BY "Difference" DESC;

SELECT geo_name,
 state_us_abbreviation AS "st",
 (CAST (p0010006 AS numeric(8,1)) / p0010001) * 100 AS "pct_asian"
FROM us_counties_2010
ORDER BY "pct_asian" DESC;



CREATE TABLE percent_change (
 department varchar(20),
 spend_2014 numeric(10,2),
 spend_2017 numeric(10,2)
);

INSERT INTO percent_change
VALUES
 ('Building', 250000, 289000),
 ('Assessor', 178556, 179500),
 ('Library', 87777, 90001),
 ('Clerk', 451980, 650000),
 ('Police', 250000, 223000),
 ('Recreation', 199000, 195000);

--round()
SELECT department, spend_2014, spend_2017, 
	round( (spend_2017 - spend_2014) /
    spend_2014 * 100, 1) AS "pct_change"
FROM percent_change;

--sum()
SELECT sum(p0010001) AS "County Sum",
 round(avg(p0010001), 0) AS "County Average"
FROM us_counties_2010;



CREATE TABLE percentile_test (
 numbers integer
);

INSERT INTO percentile_test (numbers) VALUES
 (1), (2), (3), (4), (5), (6);

--pg65
SELECT					
 percentile_cont(.5)
 WITHIN GROUP (ORDER BY numbers),
 percentile_disc(.5)
 WITHIN GROUP (ORDER BY numbers)
FROM percentile_test;


--A percentile is the value at a particular rank. 
--For example, if your score on a test is on the 95th percentile, 
--a common interpretation is that only 5% of the scores were higher than yours. 
--The median is the 50th percentile; it is commonly assumed that 50% the values 
--in a data set are above the median.

SELECT percentile_cont(array[0.25, 0.5, 0.75])
WITHIN GROUP (ORDER BY p0010001) AS "quartiles"
FROM us_counties_2010;

--unnest
SELECT unnest(
 percentile_cont(array[0.25, .5, .75])
 WITHIN GROUP (ORDER BY p0010001)
 ) AS "quartiles"
FROM us_counties_2010;


--creating a function pg69/104
-- http://wiki.postgresql.org/wiki/Aggregate_Median 

CREATE OR REPLACE FUNCTION _final_median(anyarray)
 RETURNS float8 AS
 WITH q AS
 (
 SELECT val
 FROM unnest($1) val
 WHERE VAL IS NOT NULL
 ORDER BY 1
 ),
 cnt AS
 (
 SELECT COUNT(*) AS c FROM q
 )
 SELECT AVG(val)::float8
 FROM
 (
 SELECT val FROM q
 LIMIT 2 - MOD((SELECT c FROM cnt), 2)
 OFFSET GREATEST(CEIL((SELECT c FROM cnt) / 2.0) - 1,0)
 ) q2;
 LANGUAGE sql IMMUTABLE;
 CREATE AGGREGATE median(anyelement) (
 SFUNC=array_append,
 STYPE=anyarray,
 FINALFUNC=_final_median,
 INITCOND='{}'
);


-- finding the Mode (the value that appears most often)
SELECT mode() WITHIN GROUP (ORDER BY p0010001)
FROM us_counties_2010;




-----------------------------------------------------------------------------
--JOINS
-----------------------------------------------------------------------------
CREATE TABLE departments (
 dept_id bigserial,
 dept varchar(100),
 city varchar(100),
 CONSTRAINT dept_key PRIMARY KEY (dept_id),
 CONSTRAINT dept_city_unique UNIQUE (dept, city)
);

CREATE TABLE employees (
 emp_id bigserial,
 first_name varchar(100),
 last_name varchar(100),
 salary integer,
 dept_id integer REFERENCES departments (dept_id), --foreign key
 CONSTRAINT emp_key PRIMARY KEY (emp_id),
 CONSTRAINT emp_dept_unique UNIQUE (emp_id, dept_id)
);

INSERT INTO departments (dept, city)
VALUES
 ('Tax', 'Atlanta'),
 ('IT', 'Boston');


INSERT INTO employees (first_name, last_name, salary, dept_id)
VALUES
 ('Nancy', 'Jones', 62500, 1),
 ('Lee', 'Smith', 59300, 1),
 ('Soo', 'Nguyen', 83000, 2),
 ('Janet', 'King', 95000, 2);


SELECT *
FROM employees JOIN departments
ON employees.dept_id = departments.dept_id;

------
--add table name in front of column name to select columns from multiple tables
select employees.emp_id, employees.first_name, employees.last_name,
		employees.salary, departments.dept, departments.city
FROM employees JOIN departments
ON employees.dept_id = departments.dept_id;

--------
CREATE TABLE schools_left (
 id integer CONSTRAINT left_id_key PRIMARY KEY,
 left_school varchar(30)
);

CREATE TABLE schools_right (
 id integer CONSTRAINT right_id_key PRIMARY KEY,
 right_school varchar(30)
);

INSERT INTO schools_left (id, left_school) VALUES
 (1, 'Oak Street School'),
 (2, 'Roosevelt High School'),
 (5, 'Washington Middle School'),
 (6, 'Jefferson High School');
 
INSERT INTO schools_right (id, right_school) VALUES
 (1, 'Oak Street School'),
 (2, 'Roosevelt High School'),
 (3, 'Morrison Elementary'),
 (4, 'Chase Magnet Academy'),
 (6, 'Jefferson High School');

SELECT *
FROM schools_left JOIN schools_right
ON schools_left.id = schools_right.id;

--LEFT JOIN
SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

--RIGHT JOIN
SELECT *
FROM schools_left RIGHT JOIN schools_right
ON schools_left.id = schools_right.id;

--FULL OUTER JOIN
SELECT *
FROM schools_left FULL OUTER JOIN schools_right
ON schools_left.id = schools_right.id;

--CROSS JOIN
SELECT *
FROM schools_left CROSS JOIN schools_right;

SELECT *
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id
WHERE schools_right.id IS NOT NULL;	--IS NULL / IS NOT NULL


SELECT schools_left.id,
 schools_left.left_school,
 schools_right.right_school
FROM schools_left LEFT JOIN schools_right
ON schools_left.id = schools_right.id;

--Aliases
SELECT lt.id,
 lt.left_school,
 rt.right_school
FROM schools_left AS lt LEFT JOIN schools_right AS rt
ON lt.id = rt.id;

select *
from schools_left as Sl JOIN schools_right as SR
ON Sl.id = Sr.id;


--join 3 tables
CREATE TABLE schools_enrollment (
 id integer,
 enrollment integer
);
CREATE TABLE schools_grades (
 id integer,
 grades varchar(10)
);

INSERT INTO schools_enrollment (id, enrollment)
VALUES
 (1, 360),
 (2, 1001),
 (5, 450),
 (6, 927);
 
INSERT INTO schools_grades (id, grades)
VALUES
 (1, 'K-3'),
 (2, '9-12'),
 (5, '6-8'),
 (6, '9-12');
 
SELECT lt.id, lt.left_school, en.enrollment, gr.grades
FROM schools_left AS lt LEFT JOIN schools_enrollment AS en
 ON lt.id = en.id
LEFT JOIN schools_grades AS gr
 ON lt.id = gr.id;

------------------------------
CREATE TABLE us_counties_2000 (
 geo_name varchar(90),
 state_us_abbreviation varchar(2),
 state_fips varchar(2),
 county_fips varchar(3),
 p0010001 integer,
 p0010002 integer,
 p0010003 integer,
 p0010004 integer,
 p0010005 integer,
 p0010006 integer,
 p0010007 integer,
 p0010008 integer,
 p0010009 integer,
 p0010010 integer,
 p0020002 integer,
 p0020003 integer
);

COPY us_counties_2000
FROM 'C:\Users\byron\SQL\analysis\us_counties_2000.csv'
WITH (FORMAT CSV, HEADER);

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
 
 
 
 
------------------------------
-- chap 7 pg94 / 128
------------------------------
-- dropping a constraint
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
--add a constraint
--see book--

CREATE TABLE new_york_addresses (
 longitude numeric(9,6),
 latitude numeric(9,6),
 street_number varchar(10),
 street varchar(32),
 unit varchar(7),
 postcode varchar(5),
 id integer CONSTRAINT new_york_key PRIMARY KEY
);

COPY new_york_addresses
FROM 'C:\Users\byron\SQL\analysis\city_of_new_york.csv'
WITH (FORMAT CSV, HEADER);

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'BROADWAY';

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = '52 STREET';

EXPLAIN ANALYZE SELECT * FROM new_york_addresses
WHERE street = 'ZWICKY AVENUE';

select count(longitude) from new_york_addresses

CREATE INDEX street_idx ON new_york_addresses (street);

