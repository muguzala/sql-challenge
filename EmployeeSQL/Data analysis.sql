-- List the employee number, last name, first name, sex, and salary of each employee.
select e.emp_no,e.last_name,e.first_name,e.sex,s.salary
from employees as e
JOIN salaries as s
on e.emp_no = s.emp_no


-- List the first name, last name, and hire date for the employees who were hired in 1986.
select e.first_name, e.last_name,e.hire_date
from employees as e
-- where e.hire_date BETWEEN '1986-01-01' and '1986-12-31'
where date_part ('year',e.hire_date)= '1986'

-- List the manager of each department along with their department number, department name, employee number, last name, and first name.
select d.dept_no, d.dept_name,  e.emp_no,e.last_name,e.first_name
from employees as e
JOIN dept_manager as dm
on e.emp_no = dm.emp_no
JOIN departments as d
on d.dept_no = dm.dept_no

-- List the department number for each employee along with that employee’s employee number, last name, first name, and department name.
select  e.emp_no,e.last_name,e.first_name, d.dept_name
from employees as e
JOIN dept_emp as de
on e.emp_no = de.emp_no
JOIN departments as d
on d.dept_no = de.dept_no


-- List first name, last name, and sex of each employee whose first name is Hercules and whose last name begins with the letter B.
select e.first_name, e.last_name,e.sex
from employees as e
where e.first_name = 'Hercules' and e.last_name like 'B%'


-- List each employee in the Sales department, including their employee number, last name, and first name.
select  e.emp_no,e.last_name,e.first_name, d.dept_name
from employees as e
JOIN dept_emp as de
on e.emp_no = de.emp_no
JOIN departments as d
on d.dept_no = de.dept_no
where d.dept_name = 'Sales'

-- List each employee in the Sales and Development departments, including their employee number, last name, first name, and department name.
select  e.emp_no,e.last_name,e.first_name, d.dept_name
from employees as e
JOIN dept_emp as de
on e.emp_no = de.emp_no
JOIN departments as d
on d.dept_no = de.dept_no
where d.dept_name in ('Sales', 'Development')

-- List the frequency counts, in descending order, of all the employee last names (that is, how many employees share each last name).

SELECT
	e.last_name,
	COUNT (*)
FROM
	employees as e
GROUP BY
	e.last_name
order by count desc

