In this exercise, you’ll turn the meat_poultry_egg_inspect table into useful information. You need to answer two questions: how many of the plants in the table
process meat, and how many process poultry?
The answers to these two questions lie in the activities column. Unfortunately, the column contains an assortment of text with inconsistent input. Here’s
an example of the kind of text you’ll find in the activities column:
Poultry Processing, Poultry Slaughter
Meat Processing, Poultry Processing
Poultry Processing, Poultry Slaughter

The mishmash of text makes it impossible to perform a typical count that
would allow you to group processing plants by activity. However, you can
make some modifications to fix this data. Your tasks are as follows:

1. Create two new columns called meat_processing and poultry_processing
in your table. Each can be of the type boolean.

--add both columns in one 'Alter Table' statement
ALTER TABLE meat_poultry_egg_inspect ADD COLUMN meat_processing boolean, 
ADD COLUMN poultry_processing boolean;



2. Using UPDATE, set meat_processing = TRUE on any row where the activities
column contains the text Meat Processing. Do the same update on the
poultry_processing column, but this time look for the text Poultry Processing
in activities.

UPDATE meat_poultry_egg_inspect
SET meat_processing = true
WHERE activities ilike '%meat processing%';

UPDATE meat_poultry_egg_inspect
SET poultry_processing = true
WHERE activities ilike '%Poultry Processing%';


3. Use the data from the new, updated columns to count how many plants
perform each type of activity. For a bonus challenge, count how many
plants perform both activities.


select count(meat_processing), count(poultry_processing)
from meat_poultry_egg_inspect;

select count(*)
from meat_poultry_egg_inspect
where meat_processing = true and poultry_processing = true;

