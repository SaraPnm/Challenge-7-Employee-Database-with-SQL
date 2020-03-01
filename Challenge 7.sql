-- Creating tables for PH-EmployeeDB
CREATE TABLE departments (
     dept_no VARCHAR(4) NOT NULL,
     dept_name VARCHAR(40) NOT NULL,
     PRIMARY KEY (dept_no),
     UNIQUE (dept_name)
);

CREATE TABLE employees (
     emp_no INT NOT NULL,
     birth_date DATE NOT NULL,
     first_name VARCHAR NOT NULL,
     last_name VARCHAR NOT NULL,
     gender VARCHAR NOT NULL,
     hire_date DATE NOT NULL,
     PRIMARY KEY (emp_no)
);

CREATE TABLE dept_manager (
	dept_no VARCHAR(4) NOT NULL,
	emp_no INT NOT NULL,
	from_date DATE NOT NULL,
	to_date DATE NOT NULL,
	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE dept_emp(
	emp_no INT NOT NULL,
	dept_no VARCHAR NOT NULL,
 	from_date DATE NOT NULL,
  	to_date DATE NOT NULL,  
  	FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  	FOREIGN KEY (dept_no) REFERENCES departments (dept_no),
  	PRIMARY KEY (emp_no, dept_no)
);

CREATE TABLE salaries (
  emp_no INT NOT NULL,
  salary INT NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no)
);

CREATE TABLE titles (
  emp_no INT NOT NULL,
  title VARCHAR NOT NULL,
  from_date DATE NOT NULL,
  to_date DATE NOT NULL,	
  FOREIGN KEY (emp_no) REFERENCES employees (emp_no),
  PRIMARY KEY (emp_no, from_date)
);

--Number of [titles] Retiring
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   tl.title,
	   s.salary,
	   tl.from_date,
	   tl.to_date
INTO retirement_info
FROM employees AS e
	INNER JOIN titles AS tl
		ON (e.emp_no = tl.emp_no)
	INNER JOIN salaries AS s
		ON (e.emp_no = s.emp_no)
	WHERE (e.birth_date BETWEEN '1952-01-01' AND '1955-12-31')
	AND (e.hire_date BETWEEN '1985-01-01' AND '1988-12-31')
	AND (tl.to_date = ('9999-01-01'))
ORDER BY e.emp_no ASC, tl.from_date DESC;

--Only the Most Recent Titles
---Exclude the rows of data containing duplicate names
SELECT * 
INTO retirement_info_rev
 FROM
  (SELECT *, MAX(from_date)
  OVER
    (PARTITION BY
      emp_no
    ) AS most_recent_from_date
  FROM retirement_info) tableWithCount;


SELECT * 
INTO retirement_info_with_most_recent_date 
FROM retirement_info_rev AS rir
WHERE rir.from_date = rir.most_recent_from_date
ORDER BY rir.emp_no;

ALTER TABLE retirement_info_with_most_recent_date DROP most_recent_from_date;

SELECT title, COUNT(title) 
INTO title_counts
FROM retirement_info_with_most_recent_date
GROUP BY title;

--Who’s Ready for a Mentor?
SELECT e.emp_no,
	   e.first_name,
	   e.last_name,
	   tl.title,
	   tl.from_date,
	   tl.to_date
INTO mentor_info
FROM employees AS e
	INNER JOIN titles AS tl
		ON (e.emp_no = tl.emp_no)
	WHERE (tl.to_date = ('9999-01-01'))
	AND (birth_date BETWEEN '1965-01-01' AND '1965-12-31')
	ORDER BY e.emp_no;