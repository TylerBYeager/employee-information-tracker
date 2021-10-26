INSERT INTO department_t (name)
VALUES
("Sales"),
("Engineering"),
("Finance"),
("Legal");
-- department table seed end -- 

INSERT INTO role_t (title, salary, department_id)
VALUES ("Sales Lead", 100000, 1),
       ("Salesperson", 80000, 1),
       ("Lead Engineer", 150000, 2),
       ("Software Engineer", 120000, 2),
       ("Account Manager", 160000, 3),
       ("Accountant", 125000, 3),
       ("Legal Team Lead", 250000, 4),
       ("Lawyer", 190000, 4);
-- role table seed end -- 


INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
VALUES ("John", "Doe", 1, null),
       ("Mike", "Chan", 2, 1),
       ("Ashley", "Rodriguez", 3, null),
       ("Kevin", "Tupik", 4, 2),
       ("Kunal", "Singh", 5, null),
       ("Malia", "Brown", 6, 3),
       ("Sarah", "Lourd", 7, null),
       ("Tom", "Allen", 8, 4);
-- employee table seed end --

SELECT * FROM department_t;
SELECT * FROM role_t;
SELECT * FROM employee_t;