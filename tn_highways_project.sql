CREATE SCHEMA TN_HIGHWAYS_PROJECT;
USE TN_HIGHWAYS_PROJECT;

CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(100),
    Position VARCHAR(100),
    Salary DECIMAL(10, 2),
    Department VARCHAR(100),
    JoiningDate DATE
);

CREATE TABLE Salaries (
    SalaryID INT PRIMARY KEY,
    EmployeeID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE SeniorStaff (
    SeniorStaffID INT PRIMARY KEY,
    EmployeeID INT,
    Level VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID)
);

CREATE TABLE Roads (
    RoadID INT PRIMARY KEY,
    RoadName VARCHAR(100),
    Length DECIMAL(10, 2),
    Type VARCHAR(50)
);

CREATE TABLE Materials (
    MaterialID INT PRIMARY KEY,
    MaterialName VARCHAR(100),
    Quantity DECIMAL(10, 2),
    Unit VARCHAR(50)
);

CREATE TABLE RoadMaterials (
    RoadMaterialID INT PRIMARY KEY,
    RoadID INT,
    MaterialID INT,
    QuantityUsed DECIMAL(10, 2),
    FOREIGN KEY (RoadID) REFERENCES Roads(RoadID),
    FOREIGN KEY (MaterialID) REFERENCES Materials(MaterialID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE
);

CREATE TABLE ProjectRoads (
    ProjectRoadID INT PRIMARY KEY,
    ProjectID INT,
    RoadID INT,
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID),
    FOREIGN KEY (RoadID) REFERENCES Roads(RoadID)
);

CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE TABLE MaintenanceRecords (
    RecordID INT PRIMARY KEY,
    RoadID INT,
    MaintenanceDate DATE,
    Description TEXT,
    FOREIGN KEY (RoadID) REFERENCES Roads(RoadID)
);

INSERT INTO Employees (EmployeeID, Name, Position, Salary, Department, JoiningDate) VALUES
(1, 'Arun Kumar', 'Engineer', 50000.00, 'Highways', '2020-01-15'),
(2, 'Meena Rani', 'Supervisor', 45000.00, 'Highways', '2019-03-20'),
(3, 'Rajesh Kumar', 'Technician', 30000.00, 'Highways', '2021-06-10'),
(4, 'Sita Devi', 'Clerk', 25000.00, 'Administration', '2022-02-05'),
(5, 'Vikram Singh', 'Project Manager', 70000.00, 'Highways', '2018-08-12'),
(6, 'Lakshmi Narayan', 'Engineer', 52000.00, 'Highways', '2020-04-25'),
(7, 'Kumaravel S.', 'Surveyor', 48000.00, 'Highways', '2019-11-30'),
(8, 'Priya Selvam', 'Technician', 31000.00, 'Highways', '2021-09-15'),
(9, 'Ravi Shankar', 'Supervisor', 46000.00, 'Highways', '2019-12-01'),
(10, 'Anjali R.', 'Clerk', 24000.00, 'Administration', '2022-03-10');

INSERT INTO Salaries (SalaryID, EmployeeID, Amount, PaymentDate) VALUES
(1, 1, 50000.00, '2024-01-01'),
(2, 2, 45000.00, '2024-01-01'),
(3, 3, 30000.00, '2024-01-01'),
(4, 4, 25000.00, '2024-01-01'),
(5, 5, 70000.00, '2024-01-01'),
(6, 6, 52000.00, '2024-01-01'),
(7, 7, 48000.00, '2024-01-01'),
(8, 8, 31000.00, '2024-01-01'),
(9, 9, 46000.00, '2024-01-01'),
(10, 10, 24000.00, '2024-01-01');

INSERT INTO SeniorStaff (SeniorStaffID, EmployeeID, Level) VALUES
(1, 1, 'Senior Engineer'),
(2, 2, 'Lead Supervisor'),
(3, 5, 'Project Head'),
(4, 6, 'Senior Engineer'),
(5, 3, 'Senior Technician'),
(6, 4, 'Senior Clerk'),
(7, 7, 'Chief Surveyor'),
(8, 8, 'Lead Technician'),
(9, 9, 'Senior Supervisor'),
(10, 10, 'Head Clerk');

INSERT INTO Roads (RoadID, RoadName, Length, Type) VALUES
(1,'NH44',500.00,'National Highway'),
(2,'SH48',150.00,'State Highway'),
(3,'NH38',200.50,'National Highway'),
(4,'SH49',75.25,'State Highway'),
(5,'NH67',300.75,'National Highway'),
(6,'SH50',120.50,'State Highway'),
(7,'NH45',400.80,'National Highway'),
(8,'SH51',90.90,'State Highway'),
(9,'NH32',250.60,'National Highway'),
(10,'SH52',60.40,'State Highway');

INSERT INTO Materials (MaterialID, MaterialName, Quantity , Unit) VALUES
(1,'Cement' ,1000.00 ,'Bags' ),
(2,'Bitumen' ,500.00 ,'Liters' ),
(3,'Sand' ,2000.50 ,'Cubic Meters' ),
(4,'Gravel' ,1500.75 ,'Cubic Meters' ),
(5,'Steel' ,800.25 ,'Kilograms' ),
(6,'Concrete Mix' ,6000.30 ,'Cubic Meters' ),
(7,'Asphalt' ,4000.20 ,'Liters' ),
(8,'Bricks' ,3000 ,'Pieces' ),
(9,'Paint' ,1000 ,'Liters' ),
(10,'Tiles' ,1200 ,'Pieces');

INSERT INTO RoadMaterials (RoadMaterialID , RoadID , MaterialID , QuantityUsed) VALUES
(1 ,1 ,1 ,200.50),
(2 ,1 ,2 ,1000),
(3 ,2 ,3 ,300),
(4 ,3 ,4 ,250),
(5 ,4 ,5 ,150),
(6 ,5 ,6 ,400),
(7 ,6 ,7 ,500),
(8 ,7 ,8 ,600),
(9 ,8 ,9 ,700),
(10 ,9 ,10 ,800);

INSERT INTO Projects (ProjectID , ProjectName , StartDate , EndDate) VALUES
(1 ,'Road Expansion Project' ,'2023-02-01','2024-12-31'),
(2 ,'Bridge Construction Project','2023-05-15','2025-03-30'),
(3 ,'Road Repair Project','2023-07-20','2024-08-15'),
(4 ,'New Highway Project','2023-09-10','2025-06-30'),
(5 ,'Drainage Improvement Project','2023-11-05','2024-12-20');

INSERT INTO ProjectRoads (ProjectRoadID , ProjectID , RoadID) VALUES
(1 ,1 ,1),
(2 ,1 ,2),
(3 ,2 ,3),
(4 ,2 ,4),
(5 ,3 ,5),
(6 ,3 ,6),
(7 ,4 ,7),
(8 ,4 ,8),
(9 ,5 ,9),
(10 ,5 ,10);

INSERT INTO EmployeeProjects (EmployeeProjectID ,
EmployeeID ,
ProjectID) VALUES
 (1 ,1 ,1),
 (2 ,2 ,1),
 (3 ,3 ,2),
 (4 ,4 ,2),
 (5 ,5 ,3),
 (6 ,6 ,3),
 (7 ,7 ,4),
 (8 ,8 ,4),
 (9 ,9 ,5),
 (10 ,10 ,5);
 
 INSERT INTO MaintenanceRecords (RecordID, RoadID, MaintenanceDate, Description) VALUES 
(1, 1, '2024-05-10', 'Routine maintenance completed'),
(2, 2, '2024-06-15', 'Pothole repairs done'),
(3, 3, '2024-07-20', 'Repaired road surface and markings done'),
(4, 4, '2024-08-25', 'Drainage cleaning completed on road section A-B'),
(5, 5, '2024-09-30', 'Resurfacing completed on NH67 section'),
(6, 6, '2024-10-05', 'Routine inspection completed'),
(7, 7, '2024-11-10', 'Signage replacement done'),
(8, 8, '2024-12-15', 'Road widening project initiated'),
(9, 9, '2025-01-20', 'Surface sealing applied'),
(10, 10, '2025-02-25', 'Annual maintenance check completed');

#from here i have written the queries for some analytical operations#

#total salary paid to employees#
SELECT SUM(Amount) AS TotalSalaryPaid
FROM Salaries;

#average salary by psition#
SELECT Position, AVG(Salary) AS AverageSalary
FROM Employees
GROUP BY Position;

#Count of Employees by Department#
SELECT Department, COUNT(*) AS EmployeeCount
FROM Employees
GROUP BY Department;

#Total Quantity of Materials Used for Each Road#
SELECT R.RoadName, SUM(RM.QuantityUsed) AS TotalMaterialsUsed
FROM RoadMaterials RM
JOIN Roads R ON RM.RoadID = R.RoadID
GROUP BY R.RoadName;

#Maintenance Activities Count by Road#
SELECT R.RoadName, COUNT(M.RecordID) AS MaintenanceCount
FROM MaintenanceRecords M
JOIN Roads R ON M.RoadID = R.RoadID
GROUP BY R.RoadName;

#Projects with Maximum Roads Associated#
SELECT P.ProjectName, COUNT(PR.RoadID) AS RoadCount
FROM Projects P
JOIN ProjectRoads PR ON P.ProjectID = PR.ProjectID
GROUP BY P.ProjectName
ORDER BY RoadCount DESC;

#Employee Participation in Projects#
SELECT E.Name, COUNT(EP.ProjectID) AS ProjectCount
FROM Employees E
JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
GROUP BY E.Name;

#Total Maintenance Records by Year#
SELECT YEAR(MaintenanceDate) AS Year, COUNT(*) AS TotalRecords
FROM MaintenanceRecords
GROUP BY YEAR(MaintenanceDate);

#Highest Paid Employee in Each Position#
SELECT E.Position, MAX(E.Salary) AS HighestSalaryEmployee
FROM Employees E
GROUP BY E.Position;

#Material Usage Trends Over Time#
SELECT DATE_FORMAT(MaintenanceDate, '%Y-%m') AS Month, SUM(RM.QuantityUsed) AS TotalMaterialsUsed
FROM RoadMaterials RM 
JOIN MaintenanceRecords M ON RM.RoadID = M.RoadID 
GROUP BY Month 
ORDER BY Month;

#INNER JOIN: Employee Details with Their Salaries#
SELECT E.Name, E.Position, S.Amount AS Salary
FROM Employees E
INNER JOIN Salaries S ON E.EmployeeID = S.EmployeeID;

#LEFT JOIN: All Employees with Their Project Participation------------#
SELECT E.Name, P.ProjectName
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
LEFT JOIN Projects P ON EP.ProjectID = P.ProjectID;

#RIGHT JOIN: Projects and Their Associated Roads#
SELECT P.ProjectName, R.RoadName
FROM Projects P
RIGHT JOIN ProjectRoads PR ON P.ProjectID = PR.ProjectID
RIGHT JOIN Roads R ON PR.RoadID = R.RoadID;

#CROSS JOIN: All Combinations of Roads and Materials#
SELECT R.RoadName, M.MaterialName
FROM Roads R
CROSS JOIN Materials M;

#SELF JOIN: Employees and Their Supervisors#
#SELECT E1.Name AS Employee, E2.Name AS Supervisor#
#FROM Employees E1#
#JOIN Employees E2 ON E1.ManagerID = E2.EmployeeID;#

#RIGHT JOIN for Material Usage in Projects#
SELECT M.MaterialName, P.ProjectName 
FROM Materials M 
RIGHT JOIN RoadMaterials RM ON M.MaterialID = RM.MaterialID 
RIGHT JOIN ProjectRoads PR ON RM.RoadID = PR.RoadID 
RIGHT JOIN Projects P ON PR.ProjectID = P.ProjectID;

#LEFT JOIN with Filtering: Employees Without Projects#
SELECT E.Name, P.ProjectName
FROM Employees E
LEFT JOIN EmployeeProjects EP ON E.EmployeeID = EP.EmployeeID
LEFT JOIN Projects P ON EP.ProjectID = P.ProjectID
WHERE P.ProjectName IS NULL;

#INNER JOIN with Aggregation: Total Salary by Department#
SELECT E.Department, SUM(S.Amount) AS TotalSalary
FROM Employees E
INNER JOIN Salaries S ON E.EmployeeID = S.EmployeeID
GROUP BY E.Department;

#Self Join Example: Compare Employee Salaries Within the Same Department#
SELECT E1.Name AS Employee, E2.Name AS HigherEarningEmployee, E1.Salary AS EmployeeSalary, E2.Salary AS HigherSalary
FROM Employees E1
JOIN Employees E2 ON E1.Department = E2.Department AND E1.EmployeeID <> E2.EmployeeID
WHERE E1.Salary < E2.Salary;

#Creation of stored procedure#

#Stored Procedure to Get Employee Details by Department#
DELIMITER //

CREATE PROCEDURE GetEmployeesByDepartment(IN deptName VARCHAR(100))
BEGIN
    SELECT Name, Position, Salary
    FROM Employees
    WHERE Department = deptName;
END //

DELIMITER ;

#add new employee#
DELIMITER //

CREATE PROCEDURE AddNewEmployee(
    IN empName VARCHAR(100),
    IN empPosition VARCHAR(100),
    IN empSalary DECIMAL(10, 2),
    IN empDepartment VARCHAR(100),
    IN empJoiningDate DATE
)
BEGIN
    INSERT INTO Employees (Name, Position, Salary, Department, JoiningDate)
    VALUES (empName, empPosition, empSalary, empDepartment, empJoiningDate);
END //

DELIMITER ;

#update employee salary#
DELIMITER //

CREATE PROCEDURE UpdateEmployeeSalary(
    IN empID INT,
    IN newSalary DECIMAL(10, 2)
)
BEGIN
    UPDATE Employees
    SET Salary = newSalary
    WHERE EmployeeID = empID;
END //

DELIMITER ;

#get total salary by dept#
DELIMITER //

CREATE PROCEDURE GetTotalSalaryByDepartment(IN deptName VARCHAR(100))
BEGIN
    SELECT SUM(Salary) AS TotalSalary
    FROM Employees
    WHERE Department = deptName;
END //

DELIMITER ;

#get project details with emp count#
DELIMITER //

CREATE PROCEDURE GetProjectDetailsWithEmployeeCount()
BEGIN
    SELECT P.ProjectName, COUNT(EP.EmployeeID) AS EmployeeCount
    FROM Projects P
    LEFT JOIN ProjectRoads PR ON P.ProjectID = PR.ProjectID
    LEFT JOIN EmployeeProjects EP ON PR.RoadID = EP.ProjectID
    GROUP BY P.ProjectName;
END //

DELIMITER ;

#counts emp in each project#
DELIMITER //

CREATE PROCEDURE CountEmployeesInProjects()
BEGIN
    SELECT P.ProjectName, COUNT(EP.EmployeeID) AS EmployeeCount
    FROM Projects P
    LEFT JOIN ProjectRoads PR ON P.ProjectID = PR.ProjectID
    LEFT JOIN EmployeeProjects EP ON PR.RoadID = EP.ProjectID
    GROUP BY P.ProjectName;
END //

DELIMITER ;

#calling all the stored procedures#
CALL GetEmployeesByDepartment('Highways');

CALL AddNewEmployee('John Doe', 'Technician', 32000.00, 'Highways', '2024-01-01');

CALL UpdateEmployeeSalary(1, 55000.00);

CALL GetTotalSalaryByDepartment('Highways');

CALL GetProjectDetailsWithEmployeeCount();

CALL CountEmployeesInProjects();

#creating views#
#View for Employee Details with Total Salary Paid#
CREATE VIEW EmployeeSalarySummary AS
SELECT 
    E.EmployeeID,
    E.Name,
    E.Position,
    E.Department,
    SUM(S.Amount) AS TotalSalaryPaid
FROM 
    Employees E
LEFT JOIN 
    Salaries S ON E.EmployeeID = S.EmployeeID
GROUP BY 
    E.EmployeeID;
    
#creating trigger#
#Trigger to Automatically Set Joining Date on New Employee Addition#
DELIMITER //

CREATE TRIGGER SetJoiningDateBeforeInsert
BEFORE INSERT ON Employees
FOR EACH ROW
BEGIN
    IF NEW.JoiningDate IS NULL THEN
        SET NEW.JoiningDate = CURRENT_DATE();
    END IF;
END //

DELIMITER ;

#calling the view#
SELECT * FROM EmployeeSalarySummary;

#calling the trigger#
INSERT INTO Employees (EmployeeID,Name, Position, Salary, Department) 
VALUES (11,'Saravanan', 'Engineer', 50000.00, 'Highways');

SELECT * FROM Employees WHERE Name = 'Saravanan';
