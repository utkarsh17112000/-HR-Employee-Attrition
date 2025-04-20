-- Rename column with encoding issue to clean column name
alter table  hr_employee.`wa_fn-usec_-hr-employee-attrition`
rename column ï»¿Age to Age;


-- Display all rows and columns from the dataset
SELECT * FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`;


-- Count of employees who have left the company
SELECT count(*) as "Employees left company" FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`
where Attrition="Yes";


-- Count of employees in each department
SELECT Department, count(*) as "Total Employees" FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Department
order by "Total Employees";

-- Average age of employees
SELECT round(avg(Age),0) as "Avg age" FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`;


-- List all unique job roles
SELECT distinct(JobRole) as  "Job Role" FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`;

-- Total number of employees working overtime
SELECT count(*) as  "Total Employees working overtime" FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`
where OverTime="Yes";


-- Most common job role by employee count
SELECT JobRole as  "most common job role" FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by JobRole
order by count(*) desc
limit 1;

-- Average training hours per department
select Department, round(Avg(TrainingTimesLastYear),1) as "Avg Training time" 
FROM hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Department;


-- Attrition rate per department as a percentage
select Department,
round(count(case when Attrition="Yes" then 1 end)*100.0/count(*),2) as "Attrition Rate"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Department;


-- Average salary hike for employees who left vs stayed
select Attrition, round(avg(PercentSalaryHike),2) as "Average Salary Hike" 
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Attrition;


-- Department with the most employees who were promoted
select Department, count(*) as "Total Employees" 
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
where YearsSinceLastPromotion>0
group by Department
order by "Total Employees"  desc 
limit 1;

-- Top 5 job roles by number of employees
select JobRole, count(*) as "Total Employees" 
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by JobRole
order by "Total Employees" desc
limit 5;

-- Employee count and attrition count per performance rating
select PerformanceRating, count(*) as "Total Employees",
count(case when Attrition ="Yes" then 1 end) as "Attrition Count"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by PerformanceRating;

-- Top 3 job roles with highest attrition rate
select JobRole, 
round(count(case when Attrition="Yes" then 1 end)*100.0/count(*) ,2) as Attrition_Rate 
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by JobRole
order by Attrition_Rate desc
limit 3;

-- Total employees with job satisfaction of 3 or higher, by department
select Department, count(*) as "Total employees" 
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
where JobSatisfaction>=3
group by Department;


-- Total employees by performance rating
select PerformanceRating , count(*) as "Total Employees"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by PerformanceRating;


-- Average working years grouped by attrition status
select Attrition , round(avg(TotalWorkingYears),0) as "Average Working Years"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Attrition;


-- Overtime vs attrition breakdown
select OverTime, count(*) as "Total Employee",
count(case when Attrition="Yes" then 1 end) as "Attrition Count"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by OverTime;


-- Department with highest attrition rate
select Department,
round(count(case when Attrition="Yes" then 1 end)*100.0/count(*),2) as "Attrition Rate"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Department
order by "Attrition Rate" desc
limit 1;

-- Estimated weekly pay rate by department (DailyRate * 5)
select Department, round(avg(DailyRate*5),0) as Weekly_Rate
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by Department;

-- Average tenure before leaving the company
select round(Avg(YearsAtCompany),0) as "Average Years Before Leaving"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
where Attrition="Yes";

-- Job satisfaction breakdown for employees who left
select JobSatisfaction , count(*) as "Total Employees"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
where Attrition="Yes"
group by JobSatisfaction
order by "Total Employees" desc;

-- Count of employees with poor work-life balance by department
select Department , count(*) as "Employee Count" 
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
where WorkLifeBalance in (1,2)
group by Department;

-- Average years since last promotion per job role
select JobRole, round(avg(YearsSinceLastPromotion),2) as "Year for last promotion"
from hr_employee.`wa_fn-usec_-hr-employee-attrition`
group by JobRole;















