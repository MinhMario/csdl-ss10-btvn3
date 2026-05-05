
CREATE TABLE Departments (
    Dept_ID   INT PRIMARY KEY,
    Dept_Name VARCHAR(100)
);

CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Patient_ID INT,
    Dept_ID    INT,
    Amount     DECIMAL(10, 2)
);

INSERT INTO Departments VALUES (1, 'Nội'), (2, 'Ngoại');
INSERT INTO Invoices VALUES 
    (101, 1, 1, 500.00),
    (102, 2, 1, 300.00),
    (103, 3, 2, 1000.00);
CREATE OR REPLACE VIEW Department_Revenue_View AS
SELECT 
    d.Dept_Name                AS Tên_Khoa,
    COUNT(i.Patient_ID)        AS Tổng_Bệnh_Nhân,
    SUM(i.Amount)              AS Tổng_Doanh_Thu
FROM Departments d
LEFT JOIN Invoices i ON d.Dept_ID = i.Dept_ID
GROUP BY d.Dept_ID, d.Dept_Name;


