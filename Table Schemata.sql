-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/qHJoUa
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE departments (
    dept_no VARCHAR(255) NOT NULL,
    dept_name VARCHAR(255) NOT NULL,
    CONSTRAINT PK_departments PRIMARY KEY (dept_no)
);

CREATE TABLE titles (
    title_id VARCHAR(255) NOT NULL,
    title VARCHAR(255) NOT NULL,
    CONSTRAINT PK_titles PRIMARY KEY (title_id)
);

CREATE TABLE employees (
    emp_no INT NOT NULL,
    emp_title_id VARCHAR(255) NOT NULL,
    birth_date DATE NOT NULL,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    sex CHAR(1) NOT NULL,
    hire_date DATE NOT NULL,
    CONSTRAINT PK_employees PRIMARY KEY (emp_no),
    CONSTRAINT FK_employees_emp_title_id FOREIGN KEY (emp_title_id)
        REFERENCES titles (title_id)
);

CREATE TABLE dept_emp (
    emp_no INT NOT NULL,
    dept_no VARCHAR(255) NOT NULL,
    CONSTRAINT PK_dept_emp PRIMARY KEY (emp_no, dept_no),
    CONSTRAINT FK_dept_emp_emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no),
    CONSTRAINT FK_dept_emp_dept_no FOREIGN KEY (dept_no)
        REFERENCES departments (dept_no)
);

CREATE TABLE dept_manager (
    dept_no VARCHAR(255) NOT NULL,
    emp_no INT NOT NULL,
    CONSTRAINT PK_dept_manager PRIMARY KEY (emp_no),
    CONSTRAINT FK_dept_manager_dept_no FOREIGN KEY (dept_no)
        REFERENCES departments (dept_no),
    CONSTRAINT FK_dept_manager_emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);

CREATE TABLE salaries (
    emp_no INT NOT NULL,
    salary INT NOT NULL,
    CONSTRAINT PK_salaries PRIMARY KEY (emp_no),
    CONSTRAINT FK_salaries_emp_no FOREIGN KEY (emp_no)
        REFERENCES employees (emp_no)
);