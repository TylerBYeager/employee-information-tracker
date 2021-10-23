DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;

USE company_db;

DROP TABLE IF EXISTS department_t;
CREATE TABLE department_t
(   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);


DROP TABLE IF EXISTS role_t;
CREATE TABLE role_t
(   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT 
);


DROP TABLE IF EXISTS employee_t;
CREATE TABLE employee_t
{   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT
},