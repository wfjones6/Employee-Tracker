DROP DATABASE IF EXISTS employee_tracker;

CREATE DATABASE employee_tracker;

USE employee_tracker;

CREATE TABLE department
(
    id INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE em_role
(
    id INTEGER(11) AUTO_INCREMENT NOT NULL PRIMARY KEY,
    title VARCHAR(30),
    salary DECIMAL(8,2),
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

INSERT INTO department(name) 
VALUES ("Sales"), 
       ("Engineering"),
       ("Finance"),
       ("Legal");

INSERT INTO em_role(title, salary, dep_id) 
VALUES ("Sales Manager", 167342.50, 1), 
       ("Engineer Lead", 177575.43, 2),
       ("Lead Accountant", 100113.32, 3),
       ("Attorney", 133333.11, 4),
        ("Sales", 67342.50, 1), 
       ("Engineer", 77575.43, 2),
       ("Accountant", 100113.32, 3),
       ("Paralegal", 33333.11, 4);


INSERT INTO employee(first_name, last_name, role_id, manager_id) 
VALUES ("John", "Travolta", 1, NULL), 
       ("L.Ron", "Hubbard", 2, NULL),
       ("Tom", "Cruise", 3, NULL),
       ("Leah", "Remini", 4, NULL),
        ("David", "Miscavige", 1, 1),  
       ("Kelly", "Preston", 1, 1),
       ("Laura", "Prepon", 2, 2),
        ("Kirstie", "Allie", 2, 2),
       ("Elisabeth", "Moss", 3, 3),
       ("Anne", "Archer", 3, 3),
        ("Juliette", "Lewis", 4, 4),
        ("Danny", "Masterson", 4, 4);