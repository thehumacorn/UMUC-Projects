--DBA1_audit.sql

--CREATION OF SCHEMA DBA1 
Alter session set current_schema = DBA1;

--DROPPING TABLES
DROP TABLE BidRates2017;
DROP TABLE BR2017_audit;
DROP TRIGGER BidRates2017_audit; 

DROP TABLE BidRates2018;
DROP TABLE BR2018_audit;
DROP TRIGGER BidRates2018_audit;

DROP TABLE Proposals2017;
DROP TABLE PP2017_audit;
DROP TRIGGER Proposals2017_audit;

DROP TABLE Proposals2018;
DROP TABLE PP2018_audit;
DROP TRIGGER Proposals2018_audit;

-- CREATION OF TABLES
Create TABLE BidRates2017 (
    br_id int primary key,
    bid_id VARCHAR(20) 
);
Create TABLE BidRates2018 (
   br_id int primary key,
   bid_id VARCHAR(20) 
);
Create TABLE Proposals2017 (
    p_id int primary key,
    proposal_id VARCHAR(20) 
);
Create TABLE Proposals2018 (
    p_id int primary key,
    proposal_id VARCHAR(20) 
);

-- CREATION OF AUDIT TABLES
CREATE TABLE BR2017_audit(
    new_id varchar (30),
    old_id varchar (30),
    user_name varchar (30),
    entry_date varchar (30),
    operation varchar (30)
);

CREATE TABLE BR2018_audit(
    new_id varchar (30),
    old_id varchar (30),
    user_name varchar (30),
    entry_date varchar (30),
    operation varchar (30)
);

CREATE TABLE PP2017_audit(
    new_id varchar (30),
    old_id varchar (30),
    user_name varchar (30),
    entry_date varchar (30),
    operation varchar (30)
);

CREATE TABLE PP2018_audit(
    new_id varchar (30),
    old_id varchar (30),
    user_name varchar (30),
    entry_date varchar (30),
    operation varchar (30)
);

-- CREATION OF USER PROFILE
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

-- 1 USER CREATION with Privileges to Select, Update, Insert and Delete to bidrates2017, bidrates2018, Proposals2018, and Proposals2017
DROP USER user1_SUID;
CREATE USER user1_SUID IDENTIFIED BY "Pa$$w0rd"   
DEFAULT TABLESPACE "TABLE_AUDIT"
TEMPORARY TABLESPACE "TEMP_USERSTABLE"
--PASSWORD EXPIRE 
PROFILE user_profile;

-- CREATION OF USER ROLES
DROP ROLE users_SUID;
CREATE ROLE users_SUID;
GRANT SELECT ON bidrates2017 TO users_SUID;
GRANT DELETE ON bidrates2017 TO users_SUID;
GRANT INSERT ON bidrates2017 TO users_SUID;
GRANT UPDATE ON bidrates2017 TO users_SUID;

GRANT SELECT ON bidrates2018 TO users_SUID;
GRANT DELETE ON bidrates2018 TO users_SUID;
GRANT INSERT ON bidrates2018 TO users_SUID;
GRANT UPDATE ON bidrates2018 TO users_SUID;

GRANT SELECT ON Proposals2018 TO users_SUID;
GRANT DELETE ON Proposals2018 TO users_SUID;
GRANT INSERT ON Proposals2018 TO users_SUID;
GRANT UPDATE ON Proposals2018 TO users_SUID;

GRANT SELECT ON Proposals2017 TO users_SUID;
GRANT DELETE ON Proposals2017 TO users_SUID;
GRANT INSERT ON Proposals2017 TO users_SUID;
GRANT UPDATE ON Proposals2017 TO users_SUID;

GRANT CREATE SESSION TO users_SUID;

--GRANTING ROLE user_SUID to users
GRANT users_SUID TO user1_SUID;

--CREATION OF AUDIT TRIGGERS FOR BidRates2017 TABLE
CREATE OR REPLACE TRIGGER BidRates2017_audit
BEFORE INSERT OR DELETE OR UPDATE ON BidRates2017
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR(30);
    v_date VARCHAR(30);
BEGIN
SELECT USER,to_char(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date from dual;
IF INSERTING THEN
    INSERT INTO BR2017_audit(new_id,old_id, user_name, entry_date, operation)
    VALUES (:NEW.bid_id, NULL, v_user, v_date, 'INSERT');
ELSIF DELETING THEN
    INSERT INTO BR2017_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (NULL, :OLD.bid_id, v_user, v_date, 'Delete');
ELSIF UPDATING THEN
    INSERT INTO BR2017_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (:NEW.bid_id, :OLD.bid_id, v_user, v_date, 'Update');
    
END IF;
END;

--CREATION OF AUDIT TRIGGERS FOR BidRates2018 TABLE
CREATE OR REPLACE TRIGGER BidRates2018_audit
BEFORE INSERT OR DELETE OR UPDATE ON BidRates2018
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR(30);
    v_date VARCHAR(30);
BEGIN
SELECT USER,to_char(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date from dual;
IF INSERTING THEN
    INSERT INTO BR2018_audit(new_id,old_id, user_name, entry_date, operation)
    VALUES (:NEW.bid_id, NULL, v_user, v_date, 'INSERT');
ELSIF DELETING THEN
    INSERT INTO BR2018_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (NULL, :OLD.bid_id, v_user, v_date, 'Delete');
ELSIF UPDATING THEN
    INSERT INTO BR2018_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (:NEW.bid_id, :OLD.bid_id, v_user, v_date, 'Update');
    
END IF;
END;

--CREATION OF AUDIT TRIGGERS FOR Proposals2017 TABLE
CREATE OR REPLACE TRIGGER Proposals2017_audit
BEFORE INSERT OR DELETE OR UPDATE ON Proposals2017
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR(30);
    v_date VARCHAR(30);
BEGIN
SELECT USER,to_char(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date from dual;
IF INSERTING THEN
    INSERT INTO PP2017_audit(new_id,old_id, user_name, entry_date, operation)
    VALUES (:NEW.proposal_id, NULL, v_user, v_date, 'INSERT');
ELSIF DELETING THEN
    INSERT INTO PP2017_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (NULL, :OLD.proposal_id, v_user, v_date, 'Delete');
ELSIF UPDATING THEN
    INSERT INTO PP2017_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (:NEW.proposal_id, :OLD.proposal_id, v_user, v_date, 'Update');
    
END IF;
END;

--CREATION OF AUDIT TRIGGERS FOR Proposals2018 TABLE
CREATE OR REPLACE TRIGGER Proposals2018_audit
BEFORE INSERT OR DELETE OR UPDATE ON Proposals2018
FOR EACH ROW
ENABLE
DECLARE
    v_user VARCHAR(30);
    v_date VARCHAR(30);
BEGIN
SELECT USER,to_char(sysdate, 'DD/MON/YYYY HH24:MI:SS') INTO v_user, v_date from dual;
IF INSERTING THEN
    INSERT INTO PP2018_audit(new_id,old_id, user_name, entry_date, operation)
    VALUES (:NEW.proposal_id, NULL, v_user, v_date, 'INSERT');
ELSIF DELETING THEN
    INSERT INTO PP2018_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (NULL, :OLD.proposal_id, v_user, v_date, 'Delete');
ELSIF UPDATING THEN
    INSERT INTO PP2018_audit(new_id, old_id, user_name, entry_date, operation)
    VALUES (:NEW.proposal_id, :OLD.proposal_id, v_user, v_date, 'Update');
    
END IF;
END;

--AUDIT SESSION FOR user1_SUID
AUDIT SESSION
BY user1_SUID;

select parameter,value from v$option where parameter='Unified Auditing';

SELECT * FROM dba_segments WHERE TABLESPACE_NAME='TABLE_AUDIT' ORDER BY bytes DESC;

SELECT * FROM DBA_ROLE_PRIVS ORDER BY GRANTEE DESC;

SELECT * FROM BIDRATES2018;
SELECT * FROM BIDRATES2018;
SELECT * FROM PROPOSALS2017;
SELECT * FROM PROPOSALS2018;


SELECT * FROM BR2017_AUDIT;

SELECT * FROM BR2018_AUDIT;

SELECT * FROM PP2017_AUDIT;

SELECT * FROM PP2018_AUDIT;
 
select * from DBA_AUDIT_SESSION;
