const inquirer = require("inquirer");
const mysql = require("mysql2");



// const db = mysql.createConnection({
//     host: "localhost",
//     port: 3001,
//     user: "root",
//     password: "password",
//     database: "company_db"
// });

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
                console.log("Viewing all departments")
            } else {
                console.log("error");
            };
        });
}
questions();