INSERT INTO department_t (name)
VALUE 
("Sales");

INSERT INTO department_t (name) 
VALUE
("Engineering");

INSERT INTO department_t (name)
VALUE 
("Finance");

INSERT INTO department_t (name)
VALUE 
("Legal");
<-- department table seed end --> 


INSERT INTO role_t (title, salary, department_id)
VALUE ("Sales Lead", 100000, 1);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Salesperson", 80000, 1);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Lead Engineer", 150000, 2);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Software Engineer", 120000, 2);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Account Manager", 160000, 3);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Accountant", 125000, 3);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Legal Team Lead", 250000, 4);

INSERT INTO role_t (title, salary, department_id)
VALUE ("Lawyer", 190000, 4);
<-- role table seed end --> 


INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("John", "Doe", 1, null);

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Mike", "Chan", 2, "John Doe");

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Ashley", "Rodriguez", 3, null);

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Kevin", "Tupik", 4, "Ashley Rodriguez");

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Kunal", "Singh", 5, null);

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Malia", "Brown", 6, "Kunal Singh");

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Sarah", "Lourd", 7, null)

INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUE ("Tom", "Allen", 8, "Sarah Lourd");
<-- employee table seed end -->

SELECT * FROM department_t;
SELECT * FROM role_t;
SELECT * FROM employee_t;