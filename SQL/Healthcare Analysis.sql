create database healthcare;
use healthcare;

-- Q 1 Patients above 60 years

select patient_id,age
from healthcare
where age > 60;

-- Q 2 Count patients by gender

select gender,count(*) as Gender_Count
from healthcare
group by gender;

-- Q 3 Average age per dignosis
 
select diagnosis ,avg(age) as Average_Age
from healthcare
group by diagnosis;

-- Q 4 Count Total Patients
SELECT COUNT(*) AS Total_Patients
FROM healthcare;
 
-- Q 5 Count Patients by Gender

SELECT gender, COUNT(*) AS Patient_Count
FROM healthcare
GROUP BY gender;

-- Q 6 Average Age of Patients

SELECT AVG(age) AS Average_Age
FROM healthcare;

-- Q 7 Patients Grouped by City

SELECT city, COUNT(*) AS Patient_Count
FROM healthcare
GROUP BY city;

-- Q 8 Top 5 Cities with Most Patients

SELECT city, COUNT(*) AS Patient_Count
FROM healthcare
GROUP BY city
ORDER BY Patient_Count DESC
LIMIT 5;

-- Q 9 Youngest Patient

SELECT *
FROM healthcare
ORDER BY age ASC
LIMIT 1;

-- Q 10 Average Billing Amount Cost

SELECT AVG(billing_amount_inr) AS Avg_Cost
FROM healthcare;

-- Q 11 Highest Billing Amount

select max(billing_amount_inr) as Highest_Amount
from healthcare;

-- Q 11 Highest Billing Amount
select min(billing_amount_inr)as Lowest_Amount
from healthcare;

-- Q 12 Total Revenue Genrated 

select sum(billing_amount_inr) as Total_Revenue
from healthcare;

-- Q 13 Revenue by Diagnosis

select diagnosis ,sum(billing_amount_inr) as Revenu
from healthcare
group by diagnosis;

-- Q 14 Diagnosis-wise Patient Count

SELECT diagnosis,
       COUNT(*) AS patient_count
FROM healthcare
GROUP BY diagnosis
ORDER BY patient_count DESC;

-- Q 15 Average Length of Stay

SELECT AVG(length_of_stay_days) AS avg_stay
FROM healthcare;

-- Q 16 Longest Hospital Stay
 
SELECT MAX(length_of_stay_days) AS max_stay
FROM healthcare;

-- Q 17 Patients Stayed More Than 10 Days

SELECT *
FROM healthcare
WHERE length_of_stay_days > 10;


-- Q 18 Average Stay by Department

SELECT department,
       AVG(length_of_stay_days) AS avg_stay
FROM healthcare
GROUP BY department;


-- Q 19 Admission Type Distribution

SELECT admission_type,
       COUNT(*) AS patient_count
FROM healthcare
GROUP BY admission_type;

-- Q 20 Emergency Admissions Count

SELECT COUNT(*) AS emergency_cases
FROM healthcare
WHERE admission_type = 'Emergency';

-- Q 21 Insurance Type Distribution

SELECT insurance_type,
       COUNT(*) AS total_patients
FROM healthcare
GROUP BY insurance_type;

-- Q 22 Revenue by Insurance Type

SELECT insurance_type,
       SUM(billing_amount_inr) AS revenue
FROM healthcare
GROUP BY insurance_type;

-- Q 23 Readmitted Patients

SELECT COUNT(*) AS readmitted_patients
FROM healthcare
WHERE readmission_within_30_days = 'Yes';

-- Q 24 Readmission Rate

SELECT ROUND(
    100.0 * SUM(CASE WHEN readmission_within_30_days='Yes' THEN 1 ELSE 0 END)
    / COUNT(*),
2) AS readmission_rate
FROM healthcare;

-- Q 25 Average BMI by Gender

SELECT gender,
       ROUND(AVG(bmi),2) AS avg_bmi
FROM healthcare
GROUP BY gender;

-- Q 26 Patients with High Blood Pressure

SELECT *
FROM healthcare
WHERE systolic_bp_mmhg > 140;

-- Q 27 Average Cholesterol by Diagnosis

SELECT diagnosis,
       ROUND(AVG(total_cholesterol_mg_dl),2) AS avg_cholesterol
FROM healthcare
GROUP BY diagnosis;

-- Q 28 Rank Departments by Revenue
SELECT department,
       SUM(billing_amount_inr) AS revenue,
       RANK() OVER(ORDER BY SUM(billing_amount_inr) DESC) AS dept_rank
FROM healthcare
GROUP BY department;

-- Q 29 Top 3 Diagnoses by Revenue

SELECT diagnosis,
       SUM(billing_amount_inr) AS revenue
FROM healthcare
GROUP BY diagnosis
ORDER BY revenue DESC
LIMIT 3;

-- Q 30 Monthly Revenue Trend

SELECT DATE_FORMAT(admission_date,'%Y-%m') AS month,
       SUM(billing_amount_inr) AS revenue
FROM healthcare
GROUP BY month
ORDER BY month;