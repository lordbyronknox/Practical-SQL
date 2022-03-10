Put your grouping and aggregating skills to the test with these challenges:

1. We saw that library visits have declined recently in most places. But
what is the pattern in the use of technology in libraries? Both the 2014
and 2009 library survey tables contain the columns gpterms (the number
of internet-connected computers used by the public) and pitusr (uses of
public internet computers per year). Modify the code in Listing 8-13 to calculate 
the percent change in the sum of each column over time. Watch out for negative values!

SELECT pls14.stabr,
	   gpterms AS 
       sum(pls14.visits) AS visits_2014,
       sum(pls09.visits) AS visits_2009,
       round( (CAST(sum(pls14.visits) AS decimal(10,1)) - sum(pls09.visits)) /
                    sum(pls09.visits) * 100, 2 ) AS pct_change
FROM pls_fy2014_pupld14a pls14 JOIN pls_fy2009_pupld09a pls09
ON pls14.fscskey = pls09.fscskey
WHERE pls14.visits >= 0 AND pls09.visits >= 0
GROUP BY pls14.stabr
ORDER BY pct_change DESC;



2. Both library survey tables contain a column called obereg, a two-digit
Bureau of Economic Analysis Code that classifies each library agency
according to a region of the United States, such as New England, Rocky
Mountains, and so on. Just as we calculated the percent change in visits
grouped by state, do the same to group percent changes in visits by U.S.
region using obereg. Consult the survey documentation to find the meaning
of each region code. For a bonus challenge, create a table with the obereg
code as the primary key and the region name as text, and join it to the
summary query to group by the region name rather than the code.




3. Thinking back to the types of joins you learned in Chapter 6, which join
type will show you all the rows in both tables, including those without a
match? Write such a query and add an IS NULL filter in a WHERE clause to
show agencies not included in one or the other table.