
/*
Boolean -> true, false, (NULL)
-------------------

INT:
Range: -2,147,483,648 to 2,147,483,647
Storage: 4 bytes
The INT data type is commonly used for integer values within the standard range.

BIGINT:
Range: -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807
Storage: 8 bytes
BIGINT provides a larger range than INT and is suitable for storing very large integer values.

SMALLINT:
Range: -32,768 to 32,767
Storage: 2 bytes
SMALLINT is suitable for storing small integer values within a more limited range.


FLOAT4 (Single Precision):
Storage: 4 bytes
6 digit precision

FLOAT8 (Double Precision):
15 digit precision
Storage: 8 bytes

NUMERIC(precision, scale):
Range: Unlimited precision
Storage: Variable (depends on the input precision and scale)
ex: NUMERIC(4,3)

Serial:
Range: Like integers
Auto-incrementing integer
-------------------
Character

CHAR:
CHAR is a fixed-length character type.
Storage: The length is fixed and specified when defining the column.
If the actual string is shorter than the specified length, it is padded with spaces.
Example: CHAR(10) means a fixed-length string of 10 characters.

VARCHAR:
VARCHAR is a variable-length character type.
Storage: The length is not fixed and can vary up to the specified maximum length.
No padding with spaces is done, so it is more storage-efficient when dealing with variable-length strings.
Example: VARCHAR(255) means a variable-length string with a maximum length of 255 characters.

TEXT:
TEXT is also a variable-length character type.
Storage: Similar to VARCHAR, it is not fixed in length.
Typically used for longer text strings where the exact length is not known or can vary widely.
Example: TEXT is often used for columns containing large amounts of text.

DATE
1980-12-20
Dec-20-1980
20-Dec-1980
*/


-- NOT null, unique, DEFAULT, CHECK, primary key, FOREIGN key
CREATE TABLE persons (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL, -- Adding NOT NULL constraint to ensure name is always provided
    age INTEGER CHECK (age >= 0), -- Adding CHECK constraint to ensure age is non-negative
    profession VARCHAR(100),
    isActive BOOLEAN DEFAULT TRUE, -- Adding DEFAULT constraint to set default value for isActive
    dob DATE CHECK (dob <= CURRENT_DATE), -- Adding CHECK constraint to ensure dob is not in the future
    rating NUMERIC(3,2) CHECK (rating >= 0 AND rating <= 9.99) -- Adding CHECK constraint to limit the range of numer
);


drop Table persons;
SELECT * from persons;

----- inserting data into table (3 ways)
INSERT INTO persons 
(id, name, age, profession, isActive, dob, rating) 
VALUES
(2, 'testName2', 26, 'instructor', true, '2023-02-01',  1.78);

INSERT INTO persons VALUES(5,'testName5', 35, 'teacher', true, '2024-02-01',  1.78);

INSERT INTO persons VALUES
(3, 'testName', 29, 'teacher', true, '2024-02-01',  1.78),
(4, 'testName', 28, 'teacher', false, '2024-02-01',  5.78);

-- altering table with ALTER 
/*
alter Table table_name
action

1. renaming a table NAME
2. add/drop column
3. modifying the data type of a column
4. setting default value for a column
5. renaming a column name
6. add/drop constraint
.. other things

*/
drop Table person;
SELECT * from person;

-- 1. renaming a table NAME
alter Table persons
    RENAME to person;

-- 5. renaming a column name
ALTER TABLE person
    RENAME COLUMN dob to date_of_birth;

-- 2. add/drop column
ALTER Table person
    ADD COLUMN email VARCHAR(25) not NULL DEFAULT 'n/a';

-- 3. modifying the data type of a column
alter Table person
    alter COLUMN name type VARCHAR(80)


-- 6. add/drop constraint
alter Table person
    alter COLUMN profession set not null;
alter Table person
    alter COLUMN profession drop not null;
