DROP DATABASE IF EXISTS employee_tracker;

CREATE DATABASE employee_tracker;

USE employee_tracker;

CREATE TABLE department
(
    id INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    dep_name VARCHAR(30)
);

CREATE TABLE em_role
(
    id INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL(7,2),
    dep_id INTEGER(11),
    FOREIGN KEY (dep_id)
        REFERENCES department(id)
        ON DELETE CASCADE
);

CREATE TABLE employee
(
    id INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    role_id INTEGER(11),
    manager_id INTEGER(11),
    FOREIGN KEY (role_id)
        REFERENCES em_role(id)
        ON DELETE SET NULL,
    FOREIGN KEY (manager_id)
        REFERENCES employee(id)
        ON DELETE SET NULL
);

INSERT INTO department(dep_name) 
VALUES ("Sales"), 
       ("Engineering"),
       ("Finance"),
       ("Legal");

INSERT INTO em_role(title) 
VALUES ("Salesperson"), 
       ("Engineer"),
       ("Accountant"),
       ("Paralegal");

INSERT INTO employee(first_name) 
VALUES ("John"), 
       ("L.Ron"),
       ("Tom"),
       ("Leah");

INSERT INTO employee(last_name) 
VALUES ("Travolta"), 
       ("Hubbard"),
       ("Cruise"),
       ("Remini");