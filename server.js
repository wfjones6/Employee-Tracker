var mysql = require("mysql");
var inquirer = require("inquirer");

var connection = mysql.createConnection({
  host: "localhost",

  // Your port; if not 3306
  port: 3306,

  // Your username
  user: "root",

  // Your password
  password: "root",
  database: "employee_tracker"
});

connection.connect(function(err) {
  if (err) throw err;
  console.log("connected as id " + connection.threadId + "\n");
  // createProduct();
});

function createDepartment() {
  console.log("Inserting a new department...\n");
  var query = connection.query(
    "INSERT INTO departments SET ?",
    {
      dep_name: "test department"
    },
    function(err, res) {
      if (err) throw err;
      console.log(res.affectedRows + " department inserted!\n");
    }
  );

  // logs the actual query being run
  console.log(query.sql);
}

function createRoles() {
  console.log("Inserting a new role...\n");
  var query = connection.query(
    "INSERT INTO em_role SET ?",
    {
      title: "test title",
      salary: 100.00,
      dep_id: 1
    },
    function(err, res) {
      if (err) throw err;
      console.log(res.affectedRows + " role inserted!\n");
    }
  );

  // logs the actual query being run
  console.log(query.sql);
}

function createEmployee() {
  console.log("Inserting a new employee...\n");
  var query = connection.query(
    "INSERT INTO employee SET ?",
    {
      first_name: "test first name",
      last_name: "test last name",
      role_id: 1,
      manager_id: 2,
    },
    function(err, res) {
      if (err) throw err;
      console.log(res.affectedRows + " employee inserted!\n");
    }
  );

  // logs the actual query being run
  console.log(query.sql);
}

function updateRole(salaryNum, idNum) {
  console.log("Updating role salary...\n");
  var query = connection.query(
    "UPDATE em_role SET ? WHERE ?",
    [
      {
        salary: salaryNum
      },
      {
        id: idNum
      }
    ],
    function(err, res) {
      if (err) throw err;
      console.log(res.affectedRows + " salary updated!\n");
    }
  );

  // logs the actual query being run
  console.log(query.sql);
}



function readDepartments() {
  console.log("Selecting all departments...\n");
  connection.query("SELECT * FROM department", function(err, res) {
    if (err) throw err;
    // Log all results of the SELECT statement
    console.log(res);
    // connection.end(); add a separate function called stop
  });
}

function readRoles() {
  console.log("Selecting all roles...\n");
  connection.query("SELECT * FROM em_role", function(err, res) {
    if (err) throw err;
    // Log all results of the SELECT statement
    console.log(res);
    // connection.end(); add a separate function called stop
  });
}

function readEmployees() {
  console.log("Selecting all employees...\n");
  connection.query("SELECT * FROM employee", function(err, res) {
    if (err) throw err;
    // Log all results of the SELECT statement
    console.log(res);
    // connection.end(); add a separate function called stop
  });
}
