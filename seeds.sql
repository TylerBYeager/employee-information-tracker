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


