Alter session set current_schema = DBA1; 
--Creating Tables
DROP TABLE students;
Create TABLE students (
    student_id int primary key,
    lastname VARCHAR(20),
    firstname VARCHAR(20),
    address VARCHAR(20),
    city VARCHAR(20)
);

DROP TABLE employees;
Create TABLE employees (
    employee_id int PRIMARY KEY,
    lastname VARCHAR(20),
    firstname VARCHAR(20),
    address VARCHAR(20),
    city VARCHAR(20)
);

DROP TABLE finances;
Create TABLE finances(
    finance_id int PRIMARY KEY
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

-- 4 USER CREATION with Privileges to Select, Update, Insert and Delete to students, employees, and finances
DROP USER user1_SUID;
CREATE USER user1_SUID IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_USERS"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;


DROP USER user2_SUID;
CREATE USER user2_SUID IDENTIFIED BY "Pa$$w0rd"  
DEFAULT TABLESPACE "TABLE_USERS"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;


DROP USER user3_SUID;
CREATE USER user3_SUID IDENTIFIED BY "Pa$$w0rd"  
DEFAULT TABLESPACE "TABLE_USERS"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;


DROP USER user4_SUID;
CREATE USER user4_SUID IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_USERS"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;

-- ROLES
DROP ROLE users_SUID;
CREATE ROLE users_SUID;
GRANT SELECT ON students TO users_SUID;
GRANT DELETE ON students TO users_SUID;
GRANT INSERT ON students TO users_SUID;
GRANT UPDATE ON students TO users_SUID;
GRANT SELECT ON employees TO users_SUID;
GRANT DELETE ON employees TO users_SUID;
GRANT INSERT ON employees TO users_SUID;
GRANT UPDATE ON employees TO users_SUID;
GRANT SELECT ON finances TO users_SUID;
GRANT DELETE ON finances TO users_SUID;
GRANT INSERT ON finances TO users_SUID;
GRANT UPDATE ON finances TO users_SUID;
GRANT CREATE SESSION TO users_SUID; 

--GRANTING ROLE user_SUID to users
GRANT users_SUID TO user1_SUID, user2_SUID, user3_SUID, user4_SUID;

-- 2 USER CREATION with Privileges to Select students, employees, and finances
DROP USER user1_Select;
CREATE USER user1_Select IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_USERS"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;


DROP USER user2_Select;
CREATE USER user2_Select IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_USERS"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;


-- ROLES
DROP ROLE users_Select;
CREATE ROLE users_Select;
GRANT SELECT ON students TO users_Select;
GRANT SELECT ON employees TO users_Select;
GRANT SELECT ON finances TO users_Select;
GRANT CREATE SESSION TO users_Select; 

--GRANTING ROLE user_SUID to users
GRANT users_Select TO user1_Select, user2_Select;

--QUOTA
ALTER USER user1_SUID QUOTA 500K ON Table_users;
ALTER USER user2_SUID QUOTA 500K ON Table_users;
ALTER USER user3_SUID QUOTA 500K ON Table_users;
ALTER USER user4_SUID QUOTA 500K ON Table_users;
ALTER USER user1_Select QUOTA 500K ON Table_users;
ALTER USER user2_Select QUOTA 500K ON Table_users;

SELECT * FROM DBA_ROLE_PRIVS ORDER BY GRANTEE DESC;

Select * from students;
Select * from employees;
Select * from finances;

