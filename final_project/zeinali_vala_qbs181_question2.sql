-- final exam question 2
select * into vzeinali.finaldb from Demographics a
inner join Conditions b
on 
a.contactid=b.tri_patientid
inner join Text c
on c.tri_contactId = a.contactid 


select t.contactid, t.gendercode, t.tri_age, t.parentcustomeridname,t.tri_imaginecareenrollmentstatus, 
t.address1_stateorprovince, t.tri_imaginecareenrollmentemailsentdate, t.tri_name,t.SenderName, t.TextSentDate into vzeinali.numtwoans
from vzeinali.finaldb t
inner join (
    select contactid, max(TextSentDate) as TextSentDate
    from vzeinali.finaldb
    group by contactid 
) tm on t.contactid = tm.contactid and t.TextSentDate = tm.TextSentDate

select top 10  * from vzeinali.numtwoans n order by newid()

