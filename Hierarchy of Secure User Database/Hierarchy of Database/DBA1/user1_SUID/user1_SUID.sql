insert into DBA1.students VALUES(1, 'noname', 'bob', '123 fake street', 'maryland');
insert into DBA1.students VALUES(2, 'noname', 'matt', '123 fake street', 'texas');

insert into DBA1.employees VALUES (1, 'noname', 'susan', '123 fake street', 'new york');

select * from DBA1.EMPLOYEES;

insert into DBA1.finances VALUES (1);

select * from DBA1.FINANCES;

select * from DBA1.STUDENTS;

update DBA1.students set FIRSTNAME = 'tim' where student_id = 2;

select * from DBA1.students;

delete from DBA1.students where student_id = 1;

select * from DBA1.STUDENTS;

create table muffins(
    muffin_id int primary key
);

