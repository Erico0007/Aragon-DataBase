use AragonPharmacyDatabase
go
;
--Create a view and save it as PharmacistListView.

if OBJECT_ID('PharmacistListView', 'V') is not null
	drop view PharmacistListView
;
go

create view  PharmacistListView as 

Select*
from Employees
Where JobID= 2;
go

Select*from PharmacistListView;
go
-- Create a view and save it as EmployeeListView.




if OBJECT_ID('EmployeeListView', 'V') is not null
	drop view EmployeeListView

    ;
    go
create view EmployeeListView
as 
Select count (*) as NumberRecords
from Employees
Where JobID IN (1,2,5);
GO

Select*from EmployeeListView;
go

--Create a view and save it as FirstEmployeeHiredListView

create view  FirstEmployeeHiredListView
as
Select TOP 1 EmpID,CONCAT(EmpFirst, EmpLast) as FullName , StartDate
from Employees
order by Startdate ASC;
GO 
Select*from  FirstEmployeeHiredListView;
go

--Create a view and save it as MostRecentHiredListView

Create view MostRecentHiredListView 
as 
Select TOP 1 EmpID,CONCAT(EmpFirst,EmpLast) as FullName , StartDate
from Employees
order by Startdate DESC;
GO

Select*from  MostRecentHiredListView ;
go

--Create a view and save it as EmployeePhoneListView.

Create view EmployeePhoneListView
as 
Select TOP 28 EmpID,CONCAT(EmpFirst,EmpLast) as FullName,Phone
from Employees
order by FullName asc;
go

Select*from EmployeePhoneListView ;
go


--Create a view and save it as EmployeeHourlyRateView

CREATE VIEW  EmployeeHourlyRateView
AS 
Select top 28 EmpID,CONCAT(EmpFirst,EmpLast) as FullName , HourlyRate
from employees
order by  HourlyRate DESC;
GO

Select*from  EmployeeHourlyRateView ;
go


--Create a view and save it as HourlyRateAnalysisView

create view HourlyRateAnalysisView
as 
Select 
 MAX (HourlyRate) as HighestHourlyRate,
 MIN (HourlyRate) AS LowestHourlyRate,
 AVG (Nullif (HourlyRate,0)) as AverageHourlyRate
 from Employees
 WHERE  Salary = 0;
 GO 


 Select*from  HourlyRateAnalysisView;
go


--Create a view and save it as SpeakSpanishView

Create view SpeakSpanishView
as 
Select EmpID,CONCAT(EmpFirst,EmpLast) as FullName , Memo
from Employees
Where memo like  'Speaks fluent Spanish';

go

 Select*from SpeakSpanishView;
go

--Create a view and save it as ReprimandListView

create view  ReprimandListView
as
Select EmpID,CONCAT(EmpFirst,EmpLast) as FullName , Memo
from employees
where memo like '%Reprimanded for tardiness%'
       OR memo like '%Reprimanded for missed shift%'
go

 Select*from ReprimandListView;
go



--Create a view and save it as StartDateListView

create view StartDateListView
as 
Select top 28 EmpID,CONCAT(EmpFirst,EmpLast) as FullName, StartDate
from employees 
where 
StartDate >= '2019-01-01' AND StartDate < '2020-01-01'
order  by StartDate desc;
go

 Select*from StartDateListView;
go


---Task 4 – Analyzing Data for Effective Decision Making

--Create a view and save it as DuplicatePostalCodesView

CREATE VIEW DuplicatePostalCodesView AS
SELECT 
    e.EmpFirst,
    e.EmpMI,
    e.EmpLast,
    e.Address,
    e.City,
    e.Prov,
    e.PostalCode
FROM Employees e
WHERE e.PostalCode IN (
    SELECT PostalCode
    FROM Employees
    GROUP BY PostalCode
    HAVING COUNT(*) > 1
);
GO

Select * from DuplicatePostalCodesView;
go


--Create a view and save it as NoTrainingView.

CREATE VIEW NoTrainingView AS
SELECT 
    e.EmpID,
    CONCAT(e.EmpFirst,e.EmpLast) AS FullName,
    c.ClassID,
    c.Description,
    c.Cost,
    c.Renewal,
    c.Required,
    c.Provider
    FROM Class c
    CROSS JOIN Employees e
    WHERE c.ClassID NOT IN (
    SELECT ct.ClassID
    FROM EmployeeTrainingHistory ct
    GROUP BY ct.ClassID
    );
    go

    Select * from NoTrainingView;
    go

 
 --Create a view and save it as EmployeeTrainingView.

 Create view EmployeeTrainingView AS
 SELECT
 e.EmpID,
 CONCAT(e.EmpFirst,e.EmpLast) AS FullName,
 c.ClassID,
 c.Description,
 c.Cost,
 c.Renewal,
 c.Required,
 c.Provider
 FROM Class c
 CROSS JOIN Employees e
 WHERE c.ClassID IN (
 SELECT ct.ClassID
 FROM EmployeeTrainingHistory ct
 GROUP BY ct.ClassID
 );
 go

 Select * from EmployeeTrainingView;
 go




 --Create a view and save it as UpToDateView.

 CREATE VIEW UpToDateView AS

 Select 
 e.EmpID,
 CONCAT(e.EmpFirst,e.EmpLast) AS FullName,
 c.ClassID,
 c.Cost,
 c.Renewal,
 c.Required,
 c.Provider
 FROM Employees e
 CROSS JOIN Class c
inner join(
Select 
classID,
MAX(Date) as LastCompleted
from EmployeeTrainingHistory
group by ClassID) ct on c.ClassID = ct.ClassID
where ct.LastCompleted < DATEADD(year, -c.Renewal, GETDATE());
go

Select * from UpToDateView;
go



---Create a view and save it as Top5HourlyRatesView.

create view Top5HourlyRatesView AS
SELECT TOP 5 EmpID, CONCAT(EmpFirst,EmpLast) AS FullName, HourlyRate
FROM Employees
WHERE Salary = 0
ORDER BY HourlyRate DESC;
GO

Select * from Top5HourlyRatesView;
go


--Create a view and save it as MaxMinAvgHourlyRate

CREATE VIEW MaxMinAvgHourlyRate AS
SELECT 
    MAX(HourlyRate) AS HighestHourlyRate,
    MIN(HourlyRate) AS LowestHourlyRate,
    AVG(NULLIF(HourlyRate, 0)) AS AverageHourlyRate
    FROM Employees
    WHERE Salary = 0;
    go

    Select * from MaxMinAvgHourlyRate;
    go


    --Create a view and save it as EmployeeAge.

    CREATE VIEW EmployeeAge AS
    SELECT
    EmpID,
    CONCAT(EmpFirst,EmpLast) AS FullName,
    DATEDIFF(year, DOB, GETDATE()) AS Age
    FROM Employees;
    go

    Select * from EmployeeAge;
    go


    --Create a view and save it as AvgEmployeeAgeView

    CREATE VIEW AvgEmployeeAgeView AS
    SELECT
    AVG(DATEDIFF(year, DOB, GETDATE())) AS AverageAge
    FROM Employees;
    go

    Select * from AvgEmployeeAgeView;
    go



    ---Task 5 – Creating SQL User-Defined Functions

    --Kim is preparing the human resources budget for Aragon Pharmacy and needs to analyze the annual cost of training to determine how much to budget for training classes.
    --She asks you to provide summary data for the costs by year for classes. The results you create should clearly compare the total annual costs of training classes and the annual costs per class.

    --Create a function and save as ClassCostAnalysisFn

    create function ClassCostAnalysisFn
    (
    @Year int)
    returns table
    as
    return
    (
    SELECT
    c.ClassID,
    c.Description,
    c.Cost,
    SUM(CASE WHEN YEAR(et.Date) = @Year THEN 1 ELSE 0 END) AS TotalAttendees,
    SUM(CASE WHEN YEAR(et.Date) = @Year THEN c.Cost ELSE 0 END) AS TotalCost
    FROM Class c
    LEFT JOIN EmployeeTrainingHistory et ON c.ClassID = et.ClassID
    GROUP BY c.ClassID, c.Description, c.Cost
    );
    go

    select * from ClassCostAnalysisFn(2023);
  go



  --Create a function and save it as EmpHistoryFn
  --Kim needs to remove obsolete data from the Hudson database.
  --First, she asks you to identify all employees who no longer work for Aragon Pharmacy. She then wants you to create a new history table with that data. 
  --Name the history table tblEmployeeHistory.
 
 create function EmpHistoryFn
 (
 @EhID int)
 returns table
 as 
 return
 (
 SELECT
 EHID,
 EmpFirst,
 EmpMI,
 EmpLast,
 SIN,
 DOB,
 StartDate,
 EndDate,
 Address,
 City,
 Prov,
 PostalCode,
 JobID,
 Memo,
 Phone,
 Cell,
 Salary,
 HourlyRate,
 Review
 FROM EmployeeHistory
 WHERE  EndDate IS not  NULL
 );
 go

 Select * from EmpHistoryFn(3);
 go

drop function EmpHistoryFn;
go

--Create a function and save as EmployeeTrainingHistoryFn. Kim also wants to remove records for classes that employees have completed and for which their certification has already been updated.
--She asks you to select classes in which employees earn certification.Adult CPR, Adult CPR Recertification, Child/Infant CPR, and Child/Infant CPR Recertification
--and that they attended before January 1, 2018, because certification achieved in these classes is now out of date in Canada
--Create a history table that contains this data and name the table tblEmployeeTrainingHistory.

Create function EmployeeTraningHistoryfn
(
 @EmpID int)
 returns table
 as 
  return
  (
  Select 
  EmpID,
  ClassID,
  Date
  from EmployeeTrainingHistory
  where ClassID IN (1,2,3,6) AND Date < '2018-01-01'
  );
  go

  Select * from EmployeeTraningHistoryfn(1);
  go




  --Create a function and save it as ObsoleteClassesFn. Kim checked your results and realized that tblEmployeeTrainingHistory should also include obsolete data for Defibrillator Use classes
  --Add the obsolete training records for Defibrillator Use classes to tblEmployeeTrainingHistory.Because Kim will continue to use this view for other classes as they become outdated, 
  --set up the view so that it prompts her for the necessary criteria.
  --(parameter) before running. Defibrillator Use certifications before 1/1/2017 are no longer valid.

  CREATE FUNCTION ObsoleteClassesFn
(
    @classID int,
    @Year int
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        EmpID,
        ClassID,
        Date
    FROM EmployeeTrainingHistory
    WHERE ClassID = @classID
      AND Date < DATEFROMPARTS(@Year, 1, 1)
);
GO

SELECT * FROM ObsoleteClassesFn(5, 2017);


--Create a function and save it as DeleteClassesView.
--Kim checked your results and realized that tblEmployeeTrainingHistory should also include obsolete data for Defibrillator Use classes
--Add the obsolete training records for Defibrillator Use classes to tblEmployeeTrainingHistory.Because Kim will continue to use this view for other classes as they become outdated,
--set up the view so that it prompts her for the necessary criteria.
--(parameter) before running. Defibrillator Use certifications before 1/1/2017 are no longer valid.
--Defibrillator Use certifications before 1/1/2017 are no longer valid.


Create FUNCTION DeleteClassesView

(
    @classID int,
    @Year int
)
returns table 
AS 
RETURN (
    SELECT 
        EmpID,
        ClassID,
        Date
    FROM EmployeeTrainingHistory
    WHERE ClassID = @classID
      AND Date < DATEFROMPARTS(@Year, 1, 1)
);
GO

SELECT * FROM DeleteClassesView(5, 2017);


--Create a function and save it as TechnicianRaiseFn
--Kim recently met with Mai Yan, manager of Aragon Pharmacy, who authorized a 5% raise for all current pharmacy technicians
--Update the employee records for pharmacy technicians so that their pay rate includes this 5% raise.


CREATE FUNCTION TechnicianRaiseFn
(
    @JobID int,
    @RaisePercent decimal(5,2)
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        EmpID,
        JobID,
        Salary * (1 + @RaisePercent / 100) AS NewSalary
    FROM Employees
    WHERE JobID = @JobID
);
GO
SELECT * FROM TechnicianRaiseFn(3, 5);



--Create a function and save it as RetirementView.Current Aragon Pharmacy employees are eligible for participation in a 401(k)-retirement plan after one year
--Identify each employee by full name and show whether they are eligible for the plan with a column stating “Eligible” or “Not Eligible” in the results. 

CREATE FUNCTION RetirementView
(
    @YearsOfService int
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        CONCAT(EmpFirst, ' ', EmpLast) AS FullName,
        CASE 
            WHEN DATEDIFF(year, StartDate, GETDATE()) >= @YearsOfService THEN 'Eligible'
            ELSE 'Not Eligible'
        END AS EligibilityStatus
    FROM Employees
);
go

Select * from RetirementView(1);


--Create a function and save it as Top3SalariesFn.
--Kim is meeting with Mai later today and needs to report which salaried employees earn the top three salaries
--Create a query in SQL view that lists all employees who earn the top three salaries. Be certain to separate the SQL terms to make it more readable

CREATE FUNCTION Top3SalariesFn()
RETURNS TABLE
AS
RETURN
(
    SELECT TOP 3
        EmpID,
        EmpFirst,
        EmpLast,
        Salary
    FROM Employees
    ORDER BY Salary DESC
);
GO

select * from Top3SalariesFn();



--Task 6 – Create Stored Procedures and Triggers

--The answers could be created as database objects: views, functions, stored procedures, or triggers


--How many sales did the pharmacy make last year?

create function SalesLastYearFn
(
    @StartDate date,
    @EndDate date
)
RETURNS TABLE
AS
RETURN
(
    SELECT *
    FROM RX
    WHERE Date BETWEEN @StartDate AND @EndDate
);
go

Select * from SalesLastYearFn('2017-01-01','2017-12-31');
go

--What percentage of the customers purchased at least one drug?

Create view CustomerPurchasePercentageView 
AS
SELECT 
    (SELECT COUNT(DISTINCT CustID) FROM RX) * 100.0 / (SELECT COUNT(*) FROM Customers) AS PurchasePercentage
    GO
    Select * from CustomerPurchasePercentageView;



    --What was the greatest number of drugs purchased by any one individual?


    CREATE FUNCTION MaxDrugsPurchasedFn()
    RETURNS TABLE
    AS
    RETURN
    (
        SELECT TOP 1 CustID, COUNT(*) AS DrugCount
        FROM RX
        GROUP BY CustID
        ORDER BY DrugCount DESC
    );
    GO
    Select * from MaxDrugsPurchasedFn();

  
  --What percentage of the drugs was sold out at least once last year?

CREATE FUNCTION PercentageDrugsSoldOutFn
(
    @StartDate date,
    @EndDate date
)
RETURNS TABLE
AS
RETURN
(
    SELECT 
        (SELECT COUNT(DISTINCT DIN) 
         FROM RX 
         WHERE Date BETWEEN @StartDate AND @EndDate 
           AND Quantity = 0
        ) * 100.0 /
        (SELECT COUNT(DISTINCT DIN) FROM Drug) AS PercentageSoldOut
);
GO

SELECT * 
FROM PercentageDrugsSoldOutFn('2017-01-01','2017-12-31');

  drop function PercentageDrugsSoldOutFn;




  --What percentage of all sales eventually becomes overdue?


  CREATE FUNCTION PercentageOverdueSalesFn
  (
    @CurrentDate date
    )
    RETURNS TABLE
    AS
    RETURN
    (
        SELECT 
            (SELECT COUNT(*) 
             FROM RX 
             WHERE ExpireDate < @CurrentDate 
               AND RefillsUsed < Refills
            ) * 100.0 /
            (SELECT COUNT(*) FROM RX) AS PercentageOverdue
    );
    go

    select * from PercentageOverdueSalesFn(GETDATE());


   -- What proportion of the Pharmacy customers are members of each health plans?

   create procedure ProportionCustomersByHealthPlan
   AS
   SELECT 
       PlanID,
       COUNT(*) AS CustomerCount,
       (COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Customers)) AS Proportion
       FROM Customers
       GROUP BY PlanID;
       go
       EXEC ProportionCustomersByHealthPlan;



       --What are the pharmacy’s peak hours for purchases?

       -- As stored procedure for question 6
CREATE PROCEDURE ProportionCustomersByHealthPlan
AS
BEGIN
    SELECT 
        c.PlanID,
        p.PlanName,
        COUNT(*) AS CustomerCount,
        CAST(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Customers) AS DECIMAL(5,2)) AS Proportion
    FROM Customers 

EXEC PeakHoursForPurchases;
go