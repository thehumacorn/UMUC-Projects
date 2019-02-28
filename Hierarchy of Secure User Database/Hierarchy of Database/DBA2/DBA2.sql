Alter session set current_schema = DBA2; 
DROP TABLE products;
Create TABLE products(
    product_id int PRIMARY KEY,
    product_name VARCHAR(20),
    product_price int
);

DROP TABLE sales;
Create TABLE sales (
    sale_id int PRIMARY KEY
);

DROP TABLE payroll_applications;
Create TABLE payroll_applications (
    payroll_id int PRIMARY KEY,
    firstname VARCHAR(20),
    lastname VARCHAR(20),
    pay_amount int
);

--CREATE PROFILE
DROP PROFILE user_profile CASCADE;
CREATE PROFILE user_profile 
LIMIT
    PASSWORD_REUSE_MAX         3
    PASSWORD_REUSE_TIME        30
    SESSIONS_PER_USER          2 
    CPU_PER_SESSION            UNLIMITED 
    CPU_PER_CALL               3000 
    CONNECT_TIME               45 
    LOGICAL_READS_PER_SESSION  DEFAULT 
    LOGICAL_READS_PER_CALL     1000 
    PRIVATE_SGA                15K
    COMPOSITE_LIMIT            500000
    FAILED_LOGIN_ATTEMPTS      3
    PASSWORD_LIFE_TIME 30
    PASSWORD_LOCK_TIME 7
    PASSWORD_GRACE_TIME 10
    PASSWORD_VERIFY_FUNCTION ora12c_verify_function;
    
-- 2 USER CREATION with Privileges to Select, Update, Insert and Delete to products, sales, and finances
DROP USER apps1_SUID;
CREATE USER apps1_SUID IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_APPLICATIONS"
TEMPORARY TABLESPACE "TEMP_APPSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;


DROP USER apps2_SUID;
CREATE USER apps2_SUID IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_APPLICATIONS"
TEMPORARY TABLESPACE "TEMP_APPSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;

-- ROLES
DROP ROLE apps_SUID;
CREATE ROLE apps_SUID;
GRANT SELECT ON products TO apps_SUID;
GRANT DELETE ON products TO apps_SUID;
GRANT INSERT ON products TO apps_SUID;
GRANT UPDATE ON products TO apps_SUID;
GRANT SELECT ON sales TO apps_SUID;
GRANT DELETE ON sales TO apps_SUID;
GRANT INSERT ON sales TO apps_SUID;
GRANT UPDATE ON sales TO apps_SUID;
GRANT SELECT ON payroll_applications TO apps_SUID;
GRANT DELETE ON payroll_applications TO apps_SUID;
GRANT INSERT ON payroll_applications TO apps_SUID;
GRANT UPDATE ON payroll_applications TO apps_SUID;
GRANT CREATE SESSION TO apps_SUID; 

--GRANTING ROLE user_SUID to users
GRANT apps_SUID TO apps1_SUID, apps2_SUID;

--QUOTA
ALTER USER apps1_SUID QUOTA 500K ON TABLE_APPLICATIONS;
ALTER USER apps2_SUID QUOTA 500K ON Table_APPLICATIONS;

--SELECT * FROM DBA_ROLE_PRIVS ORDER BY GRANTEE DESC;


Select * from products;
Select * from sales;
Select * from PAYROLL_APPLICATIONS;

