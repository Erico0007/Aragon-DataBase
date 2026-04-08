use AragonPharmacyDatabase;
go


if OBJECT_ID ('tempdb.. Class')is not null 
drop table Class;

create table Class (
ClassID INT IDENTITY(1,1) PRIMARY KEY,
Description varchar (40) not null,
Cost    decimal (5,2)   not null , 
Renewal  int not null, 
Required  bit  not null,
Provider varchar (100) not null,
)
;
go 

if OBJECT_ID ('tempdb.. Clinics')is not null 
drop table Clinics;

CREATE TABLE Clinics (
    ClinicID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    ClinicName VARCHAR(255) NOT NULL,
    Address1 VARCHAR(255) NOT NULL,
    Address2 VARCHAR(255),
    City VARCHAR(100) NOT NULL,
    Prov CHAR(2) NOT NULL,
    PostalCode CHAR(7) NOT NULL,
    Phone VARCHAR(15) NOT NULL
);
go 

if OBJECT_ID ('tempdb.. Customers')is not null 
drop table Customers;

CREATE TABLE Customers (
    CustID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    CustFirst VARCHAR(100) NOT NULL,
    CustLast VARCHAR(100) NOT NULL,
    Phone VARCHAR(15),
    DOB DATE NOT NULL ,
    Gender CHAR(1) NOT NULL ,
    Balance DECIMAL(10, 2) NOT NULL,
    ChildCap BIT NOT NULL,
    PlanID VARCHAR(20) NOT NULL ,
    HouseID INT NOT NULL ,
    HeadHH BIT NOT NULL ,
    Allergies VARCHAR(255) NOT NULL,
    CONSTRAINT chk_customers_Phone CHECK (Phone Like '^[0-9]*$')
);
GO 

if OBJECT_ID ('tempdb.. Doctors')is not null 
drop table Doctors;

CREATE TABLE Doctors (
    DoctorID INT IDENTITY (1,1 )  PRIMARY KEY NOT NULL ,
    DoctorFirst VARCHAR(30) NOT NULL,
    DoctorLast VARCHAR(30) NOT NULL,
    Phone VARCHAR(15) NOT NULL ,
    Cell VARCHAR(15) NOT NULL ,
    ClinicID INT NOT NULL ,
    FOREIGN KEY (ClinicID) REFERENCES Clinics(ClinicID),
	CONSTRAINT chk_Doctors_Phone CHECK (Phone Like '^[0-9]*$')
);
GO 


if OBJECT_ID ('tempdb.. Drug')is not null 
drop table Drug;

CREATE TABLE Drug (
    DIN VARCHAR(10) PRIMARY KEY Not null,
    Name VARCHAR(30) NOT NULL,
    Generic BIT NOT NULL,
    Description VARCHAR(255) not null ,
    Unit VARCHAR(10) not null ,
    Dosage DECIMAL(10, 2) not null ,
    DosageForm VARCHAR(20) not null ,
    Cost DECIMAL(10, 2) not null ,
    Price DECIMAL(10, 2) not null ,
    Fee DECIMAL(10, 2) not null ,
    Interactions VARCHAR(255) not null ,
    Supplier VARCHAR(100) not null 
);

go 

if OBJECT_ID ('tempdb.. Jobs')is not null 
drop table Jobs;

CREATE TABLE Jobs (
    JobID INT PRIMARY KEY,
    Title VARCHAR(255) NOT NULL
);
GO 


if OBJECT_ID ('tempdb.. Employees')is not null 
drop table Employees;

CREATE TABLE Employees (
    EmpID INT IDENTITY (1,1)  PRIMARY KEY NOT NULL ,
    EmpFirst VARCHAR(30) NOT NULL,
    EmpMI CHAR(2),
    EmpLast VARCHAR(30) NOT NULL,
    SIN CHAR(9) UNIQUE NOT NULL,
    DOB DATE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    Address VARCHAR(255)NOT NULL ,
    City VARCHAR(100) NOT NULL,
    Prov CHAR(2) NOT NULL ,
    PostalCode CHAR(7) NOT NULL ,
    JobID INT NOT NULL,
    Memo TEXT NOT NULL ,
    Phone VARCHAR(15) NOT NULL ,
    Cell VARCHAR(15) NOT NULL ,
    Salary DECIMAL(10, 2) NOT NULL,
    HourlyRate DECIMAL(10, 2) NOT NULL,
    ReviewDate DATE,
	 FOREIGN KEY (JobID) REFERENCES Jobs(JobID),
	CONSTRAINT chk_employees_PostalCode CHECK(PostalCode Like '[A-Z][0-9][A-Z][0-9][A-Z][0-9]'),
    CONSTRAINT chk_employees_phone CHECK (Phone Like '^[0-9]*$'),
    CONSTRAINT chk_employees_cell CHECK ( Cell Like '^[0-9]*$'),
    CONSTRAINT chk_employees_SIN CHECK ( SIN Like'^[0-9]*$')
);
go 

if OBJECT_ID ('tempdb.. EmployeeHistory')is not null 
drop table EmployeeHistory;

CREATE TABLE EmployeeHistory (
    EHID INT IDENTITY (1,1) PRIMARY KEY NOT NULL,
    EmpFirst VARCHAR(100) NOT NULL,
    EmpMI CHAR(1),
    EmpLast VARCHAR(100) NOT NULL,
    SIN CHAR(9) UNIQUE NOT NULL,
    DOB DATE NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Prov CHAR(2) NOT NULL,
    PostalCode CHAR(7) NOT NULL,
    JobID INT NOT NULL,
    Memo TEXT,
    Phone VARCHAR(15),
    Cell VARCHAR(15),
    Salary DECIMAL(10, 2),
    HourlyRate DECIMAL(10, 2),
    Review DATE,
    CONSTRAINT chk_employeehistory_PostalCode CHECK (PostalCode LIKE '[A-Z][0-9][A-Z][0-9][A-Z][0-9]'),
    CONSTRAINT chk_employeehistory_phone CHECK (Phone LIKE '[0-9]%'),
    CONSTRAINT chk_employeehistory_cell CHECK (Cell LIKE '[0-9]%'),
    CONSTRAINT chk_employeehistory_SIN CHECK (SIN LIKE '[0-9]%')
);
go

alter table EmployeeHistory
add constraint FK_Jobs foreign key (JobID) references  Jobs (JobID)
;
go 


if OBJECT_ID ('tempdb.. EmployeeTraining')is not null 
drop table EmployeeTraining;

CREATE TABLE EmployeeTraining (
    EmpID INT NOT NULL,
    Date DATE NOT NULL,
    ClassID INT NOT NULL,
    PRIMARY KEY (EmpID, Date, ClassID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);
go 

if OBJECT_ID ('tempdb.. EmployeeTrainingHistory')is not null 
drop table EmployeeTrainingHistory;



CREATE TABLE EmployeeTrainingHistory (
    EmpID INT NOT NULL,
    Date DATE NOT NULL,
    ClassID INT NOT NULL,
    PRIMARY KEY (EmpID, Date, ClassID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ClassID) REFERENCES Class(ClassID)
);
go 

if OBJECT_ID ('tempdb.. HealthPlans')is not null 
drop table HealthPlans;


CREATE TABLE HealthPlans (
    PlanID VARCHAR (50) PRIMARY KEY,
    PlanName VARCHAR(255) NOT NULL,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Prov CHAR(2) NOT NULL,
    PostalCode CHAR(7) NOT NULL,
    Phone VARCHAR(15) NOT NULL,
    Days VARCHAR(50),
    WebSite VARCHAR(255)
);
go 




if OBJECT_ID ('tempdb.. HouseHold')is not null 
drop table Household;


CREATE TABLE Household (
    HouseID INT PRIMARY KEY,
    Address VARCHAR(255) NOT NULL,
    City VARCHAR(100) NOT NULL,
    Prov CHAR(2) NOT NULL DEFAULT (0),
    PostalCode CHAR(7) NOT NULL,
    CONSTRAINT chk_household_PostalCode CHECK (PostalCode LIKE '[A-Z][0-9][A-Z][0-9][A-Z][0-9]')
);
go 

if OBJECT_ID ('tempdb.. Refill')is not null 
drop table Refill;


CREATE TABLE Refill (
    PrescriptionID INT IDENTITY (1,1) PRIMARY KEY,
    RefillDate DATE NOT NULL,
    EmpID INT NOT NULL,
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID)
);
GO

if OBJECT_ID ('tempdb.. RX')is not null 
drop table RX;


CREATE TABLE RX (
    PrescriptionID INT Identity (1,1)  PRIMARY KEY not null ,
    DIN VARCHAR(8)  NOT NULL,
    Quantity INT NOT NULL,
    Unit VARCHAR(50) NOT NULL,
    Date DATE NOT NULL,
    ExpireDate DATE NOT NULL,
    Refills INT NOT NULL,
    AutoRefill BIT NOT NULL,
    RefillsUsed INT NOT NULL,
    Instructions TEXT,
    CustID INT NOT NULL,
    DoctorID INT NOT NULL,
    FOREIGN KEY (CustID) REFERENCES Customers(CustID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);
go 