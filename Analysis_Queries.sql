--List the employee number, last name, first name, sex, and salary of each employee

select e.emp_no,e.last_name,e.first_name,e.sex,s.salary 
from employee e
inner join salaries s 
on e.emp_no = s.emp_no;

--List the first name, last name, and hire date for the employees who were hired in 1986

select first_name,last_name,date_part('YEAR',hire_date) as hire_year
from employee 
where date_part('YEAR',hire_date) in (1986);

--List the number of employees who were hired in the year 1986

select date_part('YEAR',hire_date) as hire_year, count(emp_no) as num_of_employees
from employee 
group by date_part('YEAR',hire_date)
having date_part('YEAR',hire_date) = 1986;

--36,150 employees were hired in the year 1986

--List the manager of each department along with their department number, department name, employee number, last name, and first name 

select e.emp_no,e.last_name,e.first_name,dm.dept_no,d.dept_name
from employee as e
inner join dept_manager dm 
on e.emp_no = dm.emp_no 
inner join departments d 
on dm.dept_no = d.dept_no; 

--List the department number for each employee along with that employee’s employee number, last name, first name, and department name

select de.dept_no,d.dept_name,e.emp_no,e.first_name,e.last_name
from employee e 
inner join dept_employee de 
on e.emp_no = de.emp_no 
inner join departments d 
on de.dept_no = d.dept_no;

--List each employees in the Sales department and their managers

select e.emp_no as employee_num,e.first_name as employee_firstname ,e.last_name as employee_lastname,e.hire_date as employee_hiredate, 
dpt.dept_name as employee_dept_name,mgr.emp_no as manager_emp_no, mgr.first_name as manager_firstname,
mgr.last_name as manager_lastname,mgr.hire_date as manager_hiredate
from employee e 
inner join dept_employee de 
on e.emp_no = de.emp_no 
inner join departments dpt
on de.dept_no = dpt.dept_no
inner join dept_manager dm 
on dm.dept_no = dpt.dept_no
inner join employee mgr 
on dm.emp_no = mgr.emp_no 
where dpt.dept_name = 'Sales';

--List each employee and their managers in the Sales and Development departments

select e.emp_no as employee_num,e.first_name as employee_firstname ,e.last_name as employee_lastname,e.hire_date as employee_hiredate, 
dpt.dept_name as employee_dept_name,mgr.emp_no as manager_emp_no, mgr.first_name as manager_firstname,
mgr.last_name as manager_lastname,mgr.hire_date as manager_hiredate
from employee e 
inner join dept_employee de 
on e.emp_no = de.emp_no 
inner join departments dpt
on de.dept_no = dpt.dept_no
inner join dept_manager dm 
on dm.dept_no = dpt.dept_no
inner join employee mgr 
on dm.emp_no = mgr.emp_no 
where dpt.dept_name in ('Sales','Development')
order by dpt.dept_name;


--List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name)


select e.last_name, count(e.emp_no) as employee_count
from employee e
group by e.last_name 
order by count(e.emp_no) desc;







