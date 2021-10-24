const inquirer = require("inquirer");
const mysql = require("mysql2");




const db = mysql.createConnection(
    {
        host: "localhost",
        user: "root",
        password: "password",
        database: "company_db"
    },
    console.log("success")
);


const questions = async () => {
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
                    "Update and existing employee's role?"
                ]
            },
        ])
        .then(response => {
            console.log(response);
            if (response.choice === "View all Departments?") {
                // console.log("You are now viewing all departments")
                db.query("SELECT * FROM department_t;", function(err, res) {
                    console.log(res); //database info added into conditional questions. 
                });
                questions(); 
            } else {
                console.log("error");
            };
        });
}
questions();