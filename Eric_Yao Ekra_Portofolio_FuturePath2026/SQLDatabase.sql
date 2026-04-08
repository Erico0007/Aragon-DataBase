use master
;
go

create database AragonPharmacyDatabase

on primary
(
 name = 'AragonPharmacyDatabase',
 size = 30 MB,
 FileGrowth = 10 MB,
 maxsize = unlimited, 
 filename = 'C:\Program Files\Microsoft SQL Server\MSSQL17.SQL2025\MSSQL\DATA\AragonPharmacyDatabase.mdf'
 )

 log on 

(

name = 'AragonPharmacyDatabase_log',
size = 7 MB,
filegrowth = 10%,
maxsize = 25 MB,
filename =  'C:\Program Files\Microsoft SQL Server\MSSQL17.SQL2025\MSSQL\DATA\AragonPharmacyDatabase.ldf'
)
;
go