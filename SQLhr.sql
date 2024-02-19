select*
from dbo.hr
--1. Retrieve the total number of employees in the dataset.
select count( distinct emp_name)
from dbo.general
--2. List all unique job roles in the dataset.
select distinct jobrole
from dbo.general
--3. Find the average age of employees.
select avg(age)
from dbo.general
--4. Retrieve the names and ages of employees who have worked at the company for more than 5 years.
select emp_name,age
from dbo.general
where yearsatcompany >5
--Get a count of employees grouped by their department.
select department, count(employeecount)
from dbo.general
group by department
--6. List employees who have 'High' Job Satisfaction.
select emp_name, JobSatisfaction
from dbo.general
full outer join employee
on Employee.EmployeeID = General.EmployeeID
where JobSatisfaction>=4
--7. Find the highest Monthly Income in the dataset.
select  top 1 monthlyincome
from dbo.General
order by MonthlyIncome desc
--8. List employees who have 'Travel_Rarely' as their BusinessTravel type.
select emp_name
from dbo.General
where BusinessTravel ='travel_rarely'
--9. Retrieve the distinct MaritalStatus categories in the dataset.
select distinct maritalstatus
from dbo.General
--10. Get a list of employees with more than 2 years of work experience but less than 4 years in their current role.
select emp_name
from dbo.General
where totalworkingyears >2 and YearsAtCompany <4
--11. List employees who have changed their job roles within the company (JobLevel and JobRole differ from their previous job).
select count (distinct emp_name)as countemp, emp_name
from dbo.General
group by Emp_Name
having count(distinct emp_name) >1
--12. Find the average distance from home for employees in each department.
select avg(distancefromhome)
from dbo.General
--13. Retrieve the top 5 employees with the highest MonthlyIncome.
select top 5 emp_name
from dbo.General
order by MonthlyIncome desc
--14. Calculate the percentage of employees who have had a promotion in the last year.
Select  count(YearsSinceLastPromotion) * 100.0 / (select count(distinct Emp_Name ) from dbo.General)
from dbo.General
where YearsSinceLastPromotion=1
--15. List the employees with the highest and lowest EnvironmentSatisfaction.
select emp_name, environmentsatisfaction
from dbo.General
full outer join dbo.employee
on employee.EmployeeID = General.EmployeeID
where EnvironmentSatisfaction>=4
--16. Find the employees who have the same JobRole and MaritalStatus.
select   count(maritalstatus), MaritalStatus, Emp_Name, JobRole
from dbo.General
group by  jobrole, Emp_Name
having MaritalStatus =
 --17. List the employees with the highest TotalWorkingYears who also have a PerformanceRating of 4.
 select emp_name, TotalWorkingYears, PerformanceRating
 from dbo.General
 full outer join manager
 on manager.employeeid = general.EmployeeID
 where PerformanceRating = 4
 order by TotalWorkingYears desc
 --18. Calculate the average Age and JobSatisfaction for each BusinessTravel type.
 select avg(age) as avgage, avg(jobsatisfaction)as avgjob, BusinessTravel
 from dbo.General
 full outer join employee
  on employee.EmployeeID= General.EmployeeID
  group by BusinessTravel
  2 of 2
--19. Retrieve the most common EducationField among employees.
select   top 1 EducationField
from dbo.General
group by EducationField
order by count(educationfield) desc
--20. List the employees who have worked for the company the longest but haven't had a promotion. 
 select Emp_Name
 from dbo.General
 where YearsSinceLastPromotion = 0
 order by YearsAtCompany desc
