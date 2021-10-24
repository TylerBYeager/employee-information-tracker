DROP DATABASE IF EXISTS company_db;
CREATE DATABASE company_db;

USE company_db;


CREATE TABLE department_t
(   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(30)
);



CREATE TABLE role_t
(   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL,
    department_id INT,
    FOREIGN KEY (department_id)
    REFERENCES department_t(id)
    -- ON DELETE SET NULL 
);



CREATE TABLE employee_t
(   id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INT,
    manager_id INT,
    FOREIGN KEY (role_id)
    REFERENCES role_t(id),
    FOREIGN KEY (manager_id)
    REFERENCES employee_t(id)
);