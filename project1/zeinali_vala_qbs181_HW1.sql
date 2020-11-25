-- Homework 1
-- #1a
EXEC sp_rename
    @objname = 'vzeinali.Demographics.tri_age',
    @newname = 'Age',
    @objtype = 'COLUMN'

    -- random 10 rows to print out
select top 10  * from vzeinali.Demographics d order by newid()
------------------------------------------------------------------------------
-- #1b
EXEC sp_rename
    @objname = 'vzeinali.Demographics.gendercode',
    @newname = 'Gender',
    @objtype = 'COLUMN'

    -- random 10 rows to print out
select top 10  * from vzeinali.Demographics d order by newid()

------------------------------------------------------------------------------
-- select * into vzeinali.Demographics from dbo.Demographics -- to copy tables into my DB

-- #1c
EXEC sp_rename
    @objname = 'vzeinali.Demographics.contactid',
    @newname = 'ID',
    @objtype = 'COLUMN'

    -- random 10 rows to print out
select top 10  * from vzeinali.Demographics d order by newid()
------------------------------------------------------------------------------
-- #1d
EXEC sp_rename
    @objname = 'vzeinali.Demographics.address1_stateorprovince',
    @newname = 'State',
    @objtype = 'COLUMN'

    -- random 10 rows to print out
select top 10  * from vzeinali.Demographics d order by newid()
------------------------------------------------------------------------------
-- #1e
EXEC sp_rename
    @objname = 'vzeinali.Demographics.tri_imaginecareenrollmentemailsentdate',
    @newname = 'EmailSentDate',
    @objtype = 'COLUMN'

    -- random 10 rows to print out
select top 10  * from vzeinali.Demographics d order by newid()
------------------------------------------------------------------------------
-- #1f
EXEC sp_rename
    @objname = 'vzeinali.Demographics.tri_enrollmentcompletedate',
    @newname = 'Completedate',
    @objtype = 'COLUMN'

    -- random 10 rows to print out
select top 10  * from vzeinali.Demographics d order by newid()

------------------------------------------------------------------------------
-- #1f
SELECT DATEDIFF(DAY , CONVERT(datetime,EmailSentDate),CONVERT(datetime,Completedate)) as DateDifference FROM vzeinali.Demographics d 

------------------------------------------------------------------------------
-- #2a,b,c,d,e,f,g,h
SELECT *,
CASE WHEN enrollstatus = 167410011 THEN 'Complete'
WHEN enrollstatus = 167410001 THEN 'Email'
WHEN enrollstatus = 167410004 THEN 'Non Responder'
WHEN enrollstatus = 167410005 THEN 'Facilitated Enrollment'
WHEN enrollstatus = 167410002 THEN 'Incomplete Enrollments'
WHEN enrollstatus = 167410003 THEN 'Opted Out'
WHEN enrollstatus = 167410000 THEN 'Unprocessed'
WHEN enrollstatus = 167410006 THEN 'Second email sent'
ELSE 'n/a'
END AS Enrollment_Status
FROM vzeinali.Demographics;
------------------------------------------------------------------------------
-- #3 a,b,c,d
SELECT *,
CASE WHEN Gender = '2' THEN 'Female'
WHEN Gender = '1' THEN 'Male'
WHEN Gender = '167410000' THEN 'Other'
ELSE 'Unkown'
END AS Gender1
FROM vzeinali.Demographics;
------------------------------------------------------------------------------
-- #4
SELECT *,
CASE WHEN Age > 0 AND Age < 26 THEN '0-25 years'
WHEN Age > 25 AND Age < 51 THEN '26-50 years'
WHEN Age > 50 AND Age < 76 THEN '51-75 years'
WHEN Age > 75 AND Age < 91 THEN '76-90 years'
WHEN Age > 90 THEN '90+ years'
END AS Age_Group
FROM vzeinali.Demographics;

------------------------------------------------------------------------------
