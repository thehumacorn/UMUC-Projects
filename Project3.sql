SPOOL Project3Output.log

SET ECHO ON

DROP TABLE Distributor CASCADE CONSTRAINT;
CREATE TABLE Distributor
(
DISTRIB_ID varchar(30) NOT NULL PRIMARY KEY,
Movie_SerialNumber_ID int NOT NULL,
Wholesale_Price int NOT NULL,
Movie_Category varchar(30) NOT NULL
);

DROP TABLE Video CASCADE CONSTRAINT;
CREATE TABLE Video
(
Vid_ID int NOT NULL PRIMARY KEY,
Title varchar(30) NOT NULL,
DISTRIB_ID varchar(30) NOT NULL,
Video_Price int NOT NULL,
FOREIGN KEY (DISTRIB_ID) REFERENCES Distributor(DISTRIB_ID)
);

DROP TABLE DVD CASCADE CONSTRAINT;
CREATE TABLE DVD
(
Dvd_ID int NOT NULL PRIMARY KEY,
Title varchar(255) NOT NULL,
DISTRIB_ID varchar(30) NOT NULL,
DVD_Price int NOT NULL,
FOREIGN KEY (DISTRIB_ID) REFERENCES Distributor(DISTRIB_ID)
);

DROP TABLE Inventory CASCADE CONSTRAINT;
CREATE TABLE Inventory
(
Vid_ID int NOT NULL,
Dvd_ID int NOT NULL,
FOREIGN KEY (Vid_ID) REFERENCES Video(Vid_ID),
FOREIGN KEY (Dvd_ID) REFERENCES DVD(Dvd_ID)
);

DROP TABLE Receipts_recrd CASCADE CONSTRAINT;
CREATE TABLE Receipts_recrd
(
Customer_ID int NOT NULL,
DVD_VideoRent_ID int NOT NULL,
DVDVideoReturn_ID int NOT NULL,
DiscountPercent int,
FOREIGN KEY (DVD_VideoRent_ID) REFERENCES videosANDdvds_rented(DVD_VideoRent_ID),
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (DVDVideoReturn_ID) REFERENCES DVD_VideoReturned(DVDVideoReturn_ID)
);

DROP TABLE DVD_VideoReturned CASCADE CONSTRAINT;
CREATE TABLE DVD_VideoReturned
(
DVDVideoReturn_ID int NOT NULL PRIMARY KEY,
Vid_ID int NOT NULL,
Dvd_ID int NOT NULL,
Customer_ID int NOT NULL,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (Vid_ID) REFERENCES Video(Vid_ID),
FOREIGN KEY (Dvd_ID) REFERENCES DVD(Dvd_ID)
);

DROP TABLE videosANDdvds_rented CASCADE CONSTRAINT;
CREATE TABLE videosANDdvds_rented
(
DVD_VideoRent_ID int NOT NULL PRIMARY KEY,
PreviousMonthWatchedMovies varchar(255),
Year int,
Rented_ID int NOT NULL,
Customer_ID int NOT NULL,
FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
FOREIGN KEY (Rented_ID) REFERENCES Rented(Rented_ID)
);

DROP TABLE Rented CASCADE CONSTRAINT;
CREATE TABLE Rented
(
Rented_ID int NOT NULL PRIMARY KEY,
Vid_ID int NOT NULL,
Dvd_ID int NOT NULL,
FOREIGN KEY (Vid_ID) REFERENCES Video(Vid_ID),
FOREIGN KEY (Dvd_ID) REFERENCES DVD(Dvd_ID)
);

DROP TABLE Customer CASCADE CONSTRAINT;
CREATE TABLE Customer
(
Customer_ID int NOT NULL PRIMARY KEY,
Name varchar(20) NOT NULL,
PhoneNumber varchar(30) NOT NULL,
Address varchar(255) NOT NULL,
City_State_Zip varchar(255) NOT NULL,
Charge_ID int NOT NULL UNIQUE,
RentBased_ID int NOT NULL,
FOREIGN KEY (Charge_ID) REFERENCES Charges(Charge_ID),
FOREIGN KEY (RentBased_ID) REFERENCES RentBased(RentBased_ID)
);

DROP TABLE RentBased CASCADE CONSTRAINT;
CREATE TABLE RentBased
(
RentBased_ID int NOT NULL PRIMARY KEY,
Actor varchar(20),
Actresses varchar(20),
RunningLengthMinutes int,
TypeofMovie varchar(20),
Rating varchar(20),
YearReleased int,
DirectorName varchar(20),
AcademyAwards_ID int,
FOREIGN KEY (AcademyAwards_ID) REFERENCES AcademyAwards(AcademyAwards_ID)
);

DROP TABLE AcademyAwards CASCADE CONSTRAINT;
CREATE TABLE AcademyAwards
(
AcademyAwards_ID int PRIMARY KEY,
The_Movie varchar(30),
The_Actors varchar(30),
The_Actoresses varchar(30),
The_Directors varchar(30)
);

DROP TABLE Charges CASCADE CONSTRAINT;
CREATE TABLE Charges
(
Charge_ID int NOT NULL PRIMARY KEY,
Damaged varchar(20),
Failure_to_Rewind varchar(20),
Taxes int,
Late_Fee_ID int NOT NULL,
FOREIGN KEY (Late_Fee_ID) REFERENCES LateFee(Late_Fee_ID)
);

DROP TABLE LateFee CASCADE CONSTRAINT;
CREATE TABLE LateFee
(
Late_Fee_ID int NOT NULL PRIMARY KEY,
Standard int,
Late int
);

SPOOL OFF

DESCRIBE Distributor
DESCRIBE Video
DESCRIBE DVD
DESCRIBE Inventory
DESCRIBE Receipts_recrd
DESCRIBE DVD_VideoReturned
DESCRIBE videosANDdvds_rented
DESCRIBE Rented
DESCRIBE Customer
DESCRIBE RentBased
DESCRIBE AcademyAwards
DESCRIBE Charges
DESCRIBE LateFee