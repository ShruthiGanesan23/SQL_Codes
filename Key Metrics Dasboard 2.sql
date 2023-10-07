
USE Project_HRDB;

-- OTHER KPIS:

-- Other KPI-1
-- Diversity Index:
-- Determine the diversity of the workforce by calculating the percentage of employees from different demographic groups.
SELECT
    (COUNT(DISTINCT CASE WHEN gender = 'Male' THEN employeenumber END) / COUNT(employeenumber)) * 100 AS Male_Percent,
    (COUNT(DISTINCT CASE WHEN gender = 'Female' THEN employeenumber END) / COUNT(employeenumber)) * 100 AS Female_Percent
FROM
    HR_Analytics;

-- Other KPI-2
-- Total Active Employees Based on Gender
-- Calculate the Total Number of Active Employees in the Organisation.
SELECT
    Gender,
    Count(EmployeeNumber) AS Total_Active_Employees,
    SUM(CASE
        WHEN Attrition = 'No' THEN 1
        ELSE 0
    END) / (SELECT COUNT(*) FROM HR_Analytics WHERE Attrition = "Yes") * 100 AS Percentage
FROM
	HR_Analytics
WHERE
	Attrition = "No"
GROUP BY
	Gender;

-- Other KPI-3
-- Employee Turnover Rate/Overall Attrition Rate:
-- Calculate the percentage of employees who have left the company - Attriton=Yes/Total Employees.
SELECT
    ((COUNT(DISTINCT CASE
	WHEN Attrition = "Yes" THEN 1
	ELSE 0
	END)) / COUNT(employeenumber)) * 100 AS turnover_rate
FROM
    HR_Analytics;
    
-- Other KPI-4
--  Attrition By TravelDistance:
-- Calculate the Attrition Count and Attrition Rate based on the Distance From Home.
SELECT
	Travel_Distance, Count(Attrition) AS Attrition_Count,
    SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) / (SELECT COUNT(*) FROM HR_Analytics WHERE Attrition = "Yes") * 100 AS Attrition_Rate
FROM (
    SELECT
        CASE
            WHEN DistanceFromHome >= 0 AND DistanceFromHome <= 10 THEN '0-10'
            WHEN DistanceFromHome >= 11 AND DistanceFromHome <= 20 THEN '11-20'
            WHEN DistanceFromHome >= 21 AND DistanceFromHome <= 30 THEN '21-30'
            WHEN DistanceFromHome >= 31 AND DistanceFromHome <= 40 THEN '31-40'
            ELSE '40+'
        END AS Travel_Distance,
        Attrition
    FROM
        HR_Analytics
) AS Subquery
GROUP BY
    Travel_Distance
ORDER BY
    Travel_Distance;

-- Other KPI-5:
-- Attrition Based On Gender
-- Calculate the Attritions based on Male and Female Employees.
SELECT
	Gender,
   Count(*) AS Attrition_Count,
   SUM(CASE
        WHEN Attrition = 'Yes' THEN 1
        ELSE 0
    END) / (SELECT COUNT(*) FROM HR_Analytics WHERE Attrition = "Yes") * 100 AS Attrition_Rate
FROM
	HR_Analytics
WHERE
	Attrition = "Yes"
GROUP BY
	Gender;
