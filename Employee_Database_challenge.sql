SELECT emp_no,first_name,last_name FROM employees;

SELECT title,from_date,to_date FROM titles;

-- join employees and titles table
SELECT e.emp_no,
	e.first_name,
	e.last_name,
	tt.title,
	tt.from_date,
	tt.to_date
INTO retirement_title
FROM employees as e
INNER JOIN titles as tt
ON (e.emp_no = tt.emp_no)
WHERE (birth_date BETWEEN '1952-01-01' AND '1955-12-31')
ORDER BY emp_no;

SELECT emp_no,first_name,last_name,title FROM retirement_title
SELECT * FROM retirement_title

-- Use Dictinct with Orderby to remove duplicate rows
SELECT DISTINCT ON (emp_no) emp_no,
first_name,
last_name,
title
INTO unique_titles
FROM retirement_title
WHERE to_date = '9999-01-01'
ORDER BY emp_no, to_date DESC;

-- count retiring employees
SELECT COUNT(title), ut.title
INTO retiring_titles
FROM unique_titles as ut
GROUP BY ut.title
ORDER BY count DESC;

-- create a Mentorship Eigibility table

SELECT emp_no,first_name,last_name,birth_date FROM employees

SELECT from_date,to_date FROM dept_emp
SELECT * FROM dept_emp
SELECT title from titles
SELECT * FROM titles


SELECT DISTINCT ON (emp_no) e.emp_no,
	e.first_name,
	e.last_name,
	e.birth_date,
	de.from_date,
	de.to_date,
	tt.title
INTO mentorship_eligibility
FROM employees as e
INNER JOIN dept_emp as de
ON (e.emp_no=de.emp_no)
INNER JOIN titles as tt
ON (de.emp_no=tt.emp_no)
WHERE (tt.to_date = '9999-01-01') AND
(e.birth_date BETWEEN '1965-01-01' AND '1965-12-31')
ORDER BY e.emp_no;