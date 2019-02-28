insert into DBA2.products VALUES(1, '35MM BandW Film', 6);
insert into DBA2.products VALUES(2, 'BandW Enlarger Paper', 39);

insert into DBA2.sales VALUES (1);

select * from DBA2.sales;

insert into DBA2.payroll_applications VALUES (1, 'susan', 'snoozen', 250);

select * from DBA2.products;

select * from DBA2.payroll_applications;

update DBA2.PAYROLL_APPLICATIONS set FIRSTNAME = 'sue' where PAYROLL_ID = 1;

select * from DBA2.payroll_applications;

delete from DBA2.products where product_id = 1;
delete from DBA2.products where product_id = 2;
delete from DBA2.sales where sale_id = 1;
delete from DBA2.PAYROLL_APPLICATIONS where payroll_id = 1;

select * from DBA2.products;

create table muffins(
    muffin_id int primary key
);
