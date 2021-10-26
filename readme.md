# Employee Information Tracker
 # Table of Contents
  * [Description](#description)
  * [Installation](#installation)
  * [Usage](#usage)
  * [License](#license)
  * [Contributions](#contributions)
  * [Tests](#tests) (not available in this project)
  * [Questions](#questions)
  
  ## Description  
  This employee information tracker app is a command line program that allows a user to create a database, seed it with information, and view that infomation in formatted tables. The user can then choose to add new departments, roles, employees, or even update an existing employees roles. 



  ## Code Snippets
  Here are some code snippets and what they accomplished. The first code snippet is an sql file that was used to create the database and the tables that are being used. 
  ```
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
  ```

  This second snippet is another sql file. This file was used to actually add the initial information into the database and tables. This allowed for easier testing, by having information to view, and simulated a real employee information tracker.    
  ```
  INSERT INTO department_t (name)
  VALUES
  ("Sales"),
  ("Engineering"),
  ("Finance"),
  ("Legal");
   

  INSERT INTO role_t (title, salary, department_id)
  VALUES ("Sales Lead", 100000, 1),
        ("Salesperson", 80000, 1),
        ("Lead Engineer", 150000, 2),
        ("Software Engineer", 120000, 2),
        ("Account Manager", 160000, 3),
        ("Accountant", 125000, 3),
        ("Legal Team Lead", 250000, 4),
        ("Lawyer", 190000, 4);
 


  INSERT INTO employee_t (first_name, last_name, role_id, manager_id)
  VALUES ("John", "Doe", 1, null),
        ("Mike", "Chan", 2, 1),
        ("Ashley", "Rodriguez", 3, null),
        ("Kevin", "Tupik", 4, 2),
        ("Kunal", "Singh", 5, null),
        ("Malia", "Brown", 6, 3),
        ("Sarah", "Lourd", 7, null),
        ("Tom", "Allen", 8, 4);
  ```

  The final snippet is found within the prompt.js file. What you see is code at the beginning that connects the file to MYSQL and to the database established in our sql files. Following this the app uses inquirer and .prompt() to asks a user questions. The responses from each question are then places in a variable (response.choice) and used to power various conditional statements. Each answers will use a different database query and function and ultimately use a function callback to restart the line of questioning. 
  ```
    const db = mysql.createConnection(
      {
          host: "localhost",
          user: "root",
          password: "password",
          database: "company_db"
      },
      console.log("success")
  );


  const questions = () => {
      return inquirer
          .prompt([
              {
                  type: "list",
                  message: "Please select your desired action",
                  name: "choice",
                  choices: [
                      "View all Departments?",
                      "View all employee roles?",
                      "View all employees?",
                      "Add new company department?",
                      "Add new role within the company?",
                      "Add new employee?",
                      "Update an existing employee's role?"
                  ]
              },
          ])
          .then(response => {
              console.log(response);
              if (response.choice === "View all Departments?") {
                  // console.log("You are now viewing all departments")
                  db.query("SELECT department_t.name, department_t.id FROM department_t;", function(err, res) {
                      console.table(res); //database info added into conditional questions. 
                      
                  });
                  questions();
  ```

  ## Installation
  To install:
  ```
  Once you have a working SSH key added to your Github account, go to the employee-information-tracker repository. Click the green "code" button on the top right and clonecopy the @github.com link with the SSH key option to your clipboard. 
  ```

  Next, 
  ```
  Open Gitbash or Terminal and navigate to a directory that you would like to add the cloned repository. Once in your desired directory type in
  "git clone 'right click to paste'" and press enter. This will clone the repository onto your personal machine.
  ```
  Lastly, 
  ```
  Type 'ls' into your Gitbash or Terminal to see a list of items within the directory. If you have done the previous steps correctly then you should see a respository titled "employee-information-tracker". Simply type in "code ." to open it in your code editor of choice. Lastly, check the package.json file to see the dependencies needed to run this. WIthin your terminal run an npm install and you're good to go. 

  ```

  ## Usage
  This command line program can be used to generate a very basic table of employee information. A user can use this to track their employee's roles, departments, and salaries. Future improvements will include the ability to delete employee roles, change managers, and alter how a user might want to filter their search parameters. 

  ## Built With
  * [JAVASCRIPT](https://developer.mozilla.org/en-US/docs/Web/JavaScript)
  * [NODE.JS](https://nodejs.org/en/)
  * [EXPRESS.JS](https://expressjs.com/)

  ## Deployed Link
* [See the Live Site!](https://tylerbyeager.github.io/employee-information-tracker/) 

## Authors

* **Tyler Brian Yeager**

- [Link to Repo Site](https://github.com/TylerBYeager/employee-information-tracker)
- [Link to Github](https://github.com/TylerBYeager/tylerbyeager.github.io)
- [Link to LinkedIn](https://www.linkedin.com/in/tyler-yeager-611926213/)

## Contributions

- UC Berkeley Coding Bootcamp & my pair programmers this week
- BCS learning assistants helping me get "unstuck" and gain a better understanding in the process

## License
![License](https://img.shields.io/badge/License-Apache-blue.svg)

## Questions
- wow_d2@hotmail.com