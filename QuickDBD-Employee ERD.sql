﻿-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/bvP7qM
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "titles" (
    "title_id" varchar   NOT NULL,
    "title" varchar   NOT NULL,
    CONSTRAINT "pk_titles" PRIMARY KEY (
        "title_id"
     )
);

CREATE TABLE "departments" (
    "dept_no" varchar   NOT NULL,
    "dept_name" varchar   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     )
);

CREATE TABLE "employee" (
    "emp_no" varchar   NOT NULL,
    "emp_title_id" varchar   NOT NULL,
    "birth_date" date   NOT NULL,
    "first_name" varchar   NOT NULL,
    "last_name" varchar   NOT NULL,
    "sex" varchar   NOT NULL,
    "hire_date" date   NOT NULL,
    CONSTRAINT "pk_employee" PRIMARY KEY (
        "emp_no"
     )
);

CREATE TABLE "salaries" (
    "emp_no" varchar   NOT NULL,
    "salary" dec   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" varchar   NOT NULL,
    "emp_no" varchar   NOT NULL
);

CREATE TABLE "dept_employee" (
    "emp_no" varchar   NOT NULL,
    "dept_no" varchar   NOT NULL
);

ALTER TABLE "employee" ADD CONSTRAINT "fk_employee_emp_title_id" FOREIGN KEY("emp_title_id")
REFERENCES "titles" ("title_id");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employee" ("emp_no");

ALTER TABLE "dept_employee" ADD CONSTRAINT "fk_dept_employee_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

