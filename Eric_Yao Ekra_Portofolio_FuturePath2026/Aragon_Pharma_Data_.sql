use AragonPharmacyDatabase;
go


SET IDENTITY_INSERT Class ON;

INSERT INTO Class (ClassID, Description, Cost, Renewal, Required, Provider)
VALUES
(1, 'Adult CPR', 15.00, 0, 1, 'Red Cross'),
(2, 'Child/Infant CPR', 15.00, 0, 1, 'Red Cross'),
(3, 'Adult CPR Recertification', 10.00, 1, 1, 'Red Cross'),
(4, 'First Aid', 15.00, 2, 0, 'Red Cross'),
(5, 'Defibrillator Use', 25.00, 1, 1, 'Johnston Health Systems'),
(6, 'Child/Infant CPR Recertification', 10.00, 1, 1, 'Red Cross'),
(7, 'Nutritional Supplements', 25.00, 0, 0, 'Food Co-op'),
(8, 'Yoga', 50.00, 0, 0, 'Yoga Center');

SET IDENTITY_INSERT Class OFF;
GO

SELECT * FROM Class;
GO



 SET IDENTITY_INSERT Class Off;
go 

SET IDENTITY_INSERT Clinics ON;
INSERT INTO Clinics (ClinicID, ClinicName, Address1, Address2, City, Prov, PostalCode, Phone)
VALUES
(4, 'Jonathan Archibald Professional Corp.', '10987 105 Street SW', 'Suite 204', 'Montreal', 'QC', 'T5H4B9', '7805241642'),
(5, 'Montreal Professional Group', '10542 Kingsway Avenue', 'Suite 200', 'Montreal', 'QC', 'T6K4B8', '7805426455'),
(6, 'Douglas Professional Group', '208 101 Street NE', '', 'Montreal', 'QC', 'T5L4G9', '7805455471'),
(7, 'East Montreal Center', '19876 145 Street SE', 'Building 198', 'Montreal', 'QC', 'T5M0J8', '7804553877'),
(8, 'Russell Pediatric Group', '10989 142 Street NW', 'Suite 100', 'Montreal', 'QC', 'T5N8U0', '7804558701'),
(9, 'Lam Professional Association', '8765 Avenue 29 NW', 'Suite 304', 'Montreal', 'QC', 'T6L9Y7', '7804568132'),
(10, 'Maramount Center', '9862 Avenue 29 NE', 'Suite 100', 'Montreal', 'QC', 'T6L9J3', '7804531544'),
(11, 'Finley Pediatric Group', '10097 Jasper Avenue SW', 'Building 500', 'Montreal', 'QC', 'T5H8Y7', '7803554674'),
(12, 'Samuel Clinic', '98654 101 Street SW', '', 'Montreal', 'QC', 'T5K8J8', '7805414414'),
(13, 'Yan Family Clinic', '8733 Avenue 10 N', '', 'Montreal', 'QC', 'T6H8D4', '7805445788'),
(14, 'Hayward Family Clinic', '7339 39 Avenue SW', 'Suite 1008', 'Montreal', 'QC', 'T5D4V5', '7806654571'),
(15, 'Mulligan Professional Corporation', '98765 101 Street SE', '', 'Montreal', 'QC', 'T5F7H2', '7804510841');
go 

Select*from clinics;
go

SET IDENTITY_INSERT Clinics Off;
go



BULK INSERT Customers
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Customer.txt'
WITH 
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  = '\n',
    FIRSTROW = 2,
    CODEPAGE = 'ACP'
);
GO

SELECT*FROM Customers;
GO


BULK INSERT DOCTORS
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Doctor.txt'
with 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR  =  '\n',
FIRSTROW = 2 ,
CODEPAGE = 'ACP'
);
go

SELECT*FROM Doctors;
GO



BULK INSERT Drug
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Drug.txt'
with 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR  =  '\n',
FIRSTROW = 2 ,
CODEPAGE = 'ACP'
);
go

SELECT*FROM Drug;
GO


BULK INSERT Employees
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Employee.txt'
with 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR  =  '\n',
FIRSTROW = 2 ,
CODEPAGE = 'ACP'
);
go

ALTER TABLE Employees 
ALTER COLUMN EndDate DATETIME NULL;
go


Select * from Employees;
go




BULK INSERT EmployeeHistory
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\EmployeeHistory.txt'
with 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR  =  '\n',
FIRSTROW = 2,
CODEPAGE = 'ACP'
);
GO

Select*from EmployeeHistory;
go



BULK INSERT EmployeeTraining
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\EmployeeTraining.txt'
with 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR  =  '\n',
FIRSTROW = 2,
CODEPAGE = 'ACP'
);
GO

Select*from EmployeeTraining;
go



BULK INSERT EmployeeTrainingHistory
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\EmployeeTrainingHistory.txt'
with 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR  =  '\n',
FIRSTROW = 2,
CODEPAGE = 'ACP'
);
GO

Select*from EmployeeTrainingHistory;
go



BULK INSERT HealthPlans 
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\HealthPlan.txt'
WITH 
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  =  '\n',
    FIRSTROW = 2,
    CODEPAGE = 'ACP' 
);
GO

Select*from HealthPlans;
go

BULK INSERT Household
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Household.txt'
WITH 
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  =  '\n',
    FIRSTROW = 2,
    CODEPAGE = 'OEM' 
);
GO

Select*from Household;
go



BULK INSERT Jobs
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\JobTitle.txt'
WITH 
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  =  '\n',
    FIRSTROW = 2,
    CODEPAGE = 'OEM' 
);
GO

Select*from Jobs;
go

BULK INSERT Refill
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Refill.txt'
WITH 
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  =  '\n',
    FIRSTROW = 2,
    CODEPAGE = 'OEM' 
);
GO

Select*From Refill;
GO

BULK INSERT RX
FROM 'C:\Users\Eric\Desktop\SQL Practice\Aragon Database\Aragon_Pharma_Data_sources\Rx.txt'
WITH 
(
    FIELDTERMINATOR = ',',
    ROWTERMINATOR  =  '\n',
    FIRSTROW = 2,
    CODEPAGE = 'ACP' 

);


Select*From RX;
GO