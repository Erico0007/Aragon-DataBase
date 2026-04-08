

⭐ Aragon Pharmacy Canada – Project Summary
This is a full database design & development project where you and your team must build a complete SQL database system for Aragon Pharmacy Canada, a Canadian adaptation of the U.S. 4Corners Pharmacy case study.
You must design, implement, populate, and analyze a database using MySQL or SQL Server.
The project is divided into 6 major tasks, each with multiple deliverables.

🧩 Overall Goal
Create a fully functional database system for a pharmacy, including:
• 	ERD & data model
• 	Tables, constraints, and schemas
• 	Views, functions, stored procedures, triggers
• 	Data analysis queries
• 	A complete SQL script submission
The project simulates real‑world HR, finance, operations, and pharmacy management needs.

🧱 Task 1 — Database Design & Table Creation
You must:
1. Follow the full database design process
Using the 4Corners Pharmacy case study as a reference, but adapting it to Canadian requirements.
2. Create the Aragon Pharmacy database
Including schema(s) and at least 12 tables, such as:
• 	Doctor
• 	Customer
• 	Employee
• 	Drug
• 	Prescription
• 	Training
• 	Job titles
• 	Certifications
• 	Sales
• 	Inventory
• 	Reprimands
• 	Health plans
• 	Etc.
3. Apply business rules
Based on the case study and Canadian context (e.g., Quebec province default).

🔒 Task 2 — Constraints & Data Integrity
You must implement all types of constraints:
• 	Primary keys
• 	Foreign keys
• 	Unique
• 	Check
• 	Default
• 	Regular expression constraints (e.g., phone number format)
You must also:
• 	Set QC as default province for customers
• 	Write scripts to add:
• 	All PKs
• 	All FKs
• 	All defaults
• 	All checks
• 	All unique constraints
This ensures full referential integrity.

👁️ Task 3 — Creating Views (HR‑focused)
You will create multiple views to help HR manager Kim Siemers analyze employee data.
Examples:
• 	PharmacistListView — count pharmacists
• 	EmployeeListView — pharmacists, owners, managers
• 	FirstEmployeeHiredListView — earliest and latest hire
• 	EmployeePhoneListView — alphabetical phone list
• 	EmployeeHourlyRateView — hourly wages, descending
• 	HourlyRateAnalysisView — min, max, avg hourly rates
• 	SpeakSpanishView — Spanish‑speaking employees
• 	ReprimandListView — employees with reprimands
• 	StartDateListView — employees hired between 2019–2020
These views simulate real HR reporting.

📊 Task 4 — Data Analysis Views
More advanced analytical views, including:
• 	DuplicatePostalCodesView — for carpool planning
• 	NoTrainingView — employees missing certifications
• 	EmployeeTrainingView — all employees + their classes
• 	UpToDateView — expired certifications
• 	Top5HourlyRatesView — highest paid hourly employees
• 	MaxMinAvgHourlyRate — stats by job category
• 	EmployeeAge — age calculation with decimals
• 	AvgEmployeeAgeView — average age by job title
These views support HR, operations, and compliance.

🧮 Task 5 — User‑Defined Functions
You must create SQL functions to automate business logic:
1. 	ClassCostAnalysisFn — annual training cost summary
2. 	EmpHistoryFn — move ex‑employees to history table
3. 	EmployeeTrainingHistoryFn — archive outdated certifications
4. 	ObsoleteClassesFn — add obsolete defibrillator classes
5. 	DeleteClassesView — delete archived training records
6. 	TechnicianRaiseFn — apply 5% raise to technicians
7. 	RetirementView — determine 401(k) eligibility
8. 	Top3SalariesFn — top 3 salaried employees
These simulate real HR automation.

⚙️ Task 6 — Stored Procedures & Triggers
You must create:
• 	Stored procedures
• 	Triggers
• 	Transaction management
These support:
• 	Data validation
• 	Automatic updates
• 	Business rule enforcement
• 	Audit trails

📦 Final Deliverables
Each team member must submit:
• 	SQL scripts (not the database file)
• 	Documentation explaining:
• 	ERD
• 	Design decisions
• 	Business rules
• 	How constraints, views, functions, triggers were implemented
Grading covers:
• 	ERD quality
• 	Normalization
• 	Keys & constraints
• 	Table creation
• 	Data integrity
• 	Views, functions, procedures, triggers
• 	Teamwork
• 	Creativity
• 	Data manipulation
• 	Indexes
• 	Subqueries
• 	Transactions
