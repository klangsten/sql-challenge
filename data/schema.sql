CREATE TABLE dept_emp (
    emp_no int  NOT NULL ,
    dept_no varchar  NOT NULL ,
    PRIMARY KEY (
        emp_no,dept_no
    )
);

CREATE TABLE departments (
    dept_no varchar  NOT NULL ,
    dept_name string  NOT NULL ,
    PRIMARY KEY (
        dept_no
    )
);

CREATE TABLE dept_manager (
    dept_no varchar  NOT NULL ,
    emp_no int  NOT NULL 
);

CREATE TABLE employees (
    emp_no int  NOT NULL ,
    emp_title_id varchar  NOT NULL ,
    birth_date date  NOT NULL ,
    first_name string  NOT NULL ,
    last_name string  NOT NULL ,
    sex string  NOT NULL ,
    hire_date date  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE salaries (
    emp_no int  NOT NULL ,
    salary int  NOT NULL ,
    PRIMARY KEY (
        emp_no
    )
);

CREATE TABLE titles (
    title_id varchar  NOT NULL ,
    title string  NOT NULL ,
    PRIMARY KEY (
        title_id
    )
);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE dept_emp ADD CONSTRAINT fk_dept_emp_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_dept_no FOREIGN KEY(dept_no)
REFERENCES departments (dept_no);

ALTER TABLE dept_manager ADD CONSTRAINT fk_dept_manager_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

ALTER TABLE employees ADD CONSTRAINT fk_employees_emp_title_id FOREIGN KEY(emp_title_id)
REFERENCES titles (title_id);

ALTER TABLE salaries ADD CONSTRAINT fk_salaries_emp_no FOREIGN KEY(emp_no)
REFERENCES employees (emp_no);

--------------------------------------------------------------------------

-- DATA ANALYSIS --

-- List the following details of each employee: employee number, last name, first name, sex, and salary.
SELECT  employee.emp_no,
        employee.last_name,
        employee.first_name,
        employee.sex,
        salary.salary
FROM employees as employee
    INNER JOIN salaries as salary
    ON (employee.emp_no = salary.emp_no)
ORDER BY employee.emp_no;

-- List first name, last name, and hire date for employees who were hired in 1986.
SELECT emp_no, first_name, last_name, hire_date from employees
WHERE hire_date >= '1985-12-31'
AND hire_date < '1987-01-01';

-- List the manager of each department with the following information: department number, department name, the manager's employee number, last name, first name.


-- List the department of each employee with the following information: employee number, last name, first name, and department name.


-- List first name, last name, and sex for employees whose first name is "Hercules" and last names begin with "B."


-- List all employees in the Sales department, including their employee number, last name, first name, and department name.


-- List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.


-- In descending order, list the frequency count of employee last names, i.e., how many employees share each last name.