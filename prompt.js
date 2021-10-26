const inquirer = require("inquirer");
const mysql = require("mysql2");
const cTable = require("console.table")




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
            } else if (response.choice === "View all employee roles?") {
                db.query("SELECT role_t.title, role_t.id, department_t.name, role_t.salary FROM role_t JOIN department_t ON role_t.id = department_t.id;", function(err, res) {
                    console.table(res);
                });
                
                questions();
            } else if (response.choice === "View all employees?") {
                db.query("SELECT employee_t.id, employee_t.first_name, employee_t.last_name, role_t.title, employee_t.manager_id, role_t.salary FROM employee_t JOIN role_t ON employee_t.role_id = role_t.id;", function(err, res) {
                    console.table(res);
                });
                questions();
            } else if (response.choice === "Add new company department?") {
                inquirer.prompt([
                    {
                        type: "input",
                        message: "What is the name of the new department?",
                        name: "name",
                    }
                ]).then(answer => {
                    db.query("INSERT INTO department_t SET ?",
                    {
                        name: answer.name
                    }), db.query("SELECT department_t.name, department_t.id FROM department_t;", function(err, res) {
                        console.table(res);
                    });
                    questions();
                });
            } else if (response.choice === "Add new role within the company?") {
                inquirer.prompt([
                    {
                        type: "input",
                        message: "What is the name of the role to be added?",
                        name: "title"
                    },
                    {
                        type: "input",
                        message: "What is the role's salary?",
                        name: "salary" 
                    },
                ]).then(answers => {
                    db.query("INSERT INTO role_t SET ?", 
                    {
                        title: answers.title,
                        salary: answers.salary,
                    }), db.query("SELECT * FROM role_t;", function(err, res) {
                        console.table(res);
                    });
                    questions();
                });
            } else if (response.choice === "Add new employee?") {
                inquirer.prompt([
                    {
                        type: "input",
                        message: "Enter their first name",
                        name: "first_name"
                    },
                    {
                        type: "input",
                        message: "Enter their last name",
                        name: "last_name"
                    },
                    {
                        type: "input",
                        message: "Enter their role in the company",
                        name: "role"
                    },
                    {
                        type: "input",
                        message: "Who is their manager?",
                        name: "manager"
                    },
                ]).then(employee => {
                    db.query("INSERT INTO employee_t SET ?", 
                    {
                        first_name: employee.first_name,
                        last_name: employee.last_name,
                    }), db.query("SELECT * FROM employee_t;", function(err, res) {
                        console.table(res);
                    });
                    questions();
                });
            } else if (response.choice === "Update an existing employee's role?") {
                console.log("no");
            };
        });
};
questions();