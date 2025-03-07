-- create the database
DROP DATABASE IF EXISTS gamecompany;
CREATE DATABASE gamecompany;

-- select the database
USE gamecompany;

-- create the tables

CREATE TABLE jobrole 
(
    job_id 	  INT 			PRIMARY KEY		NOT NULL,
    role_type VARCHAR(255)  NULL
);

INSERT INTO jobrole VALUES
(1, "Designer"),
(2, "Programmer"),
(3, "Animator"),
(4, "Writer"),
(5, "Sound Designer");

CREATE TABLE projectstate 
(
    state_id   INT 			PRIMARY KEY 	NOT NULL,
    state_name VARCHAR(255) NULL
);

INSERT INTO projectstate VALUES
(1, "Launch"),
(2, "Pre-Launch"),
(3, "Planning");


CREATE TABLE employee 
(
    employee_id 	INT 			PRIMARY KEY		NOT NULL,
    firstName 		VARCHAR(255)	NULL,
    lastName 		VARCHAR(255)	NULL,
    job_id 			INT				NULL,
    FOREIGN KEY (job_id) 
	REFERENCES jobrole (job_id)
);

INSERT INTO employee VALUES
(1, "Saul", "Tellez", 1),
(2, "Ethan", "Smith", 1),
(3, "Grace", "North", 2),
(4, "Olivia", "Jones", 2),
(5, "Mason", "Taylor", 3),
(6, "Sophia", "Clark", 3),
(7, "Liam", "Johnson", 4),
(8, "Sean", "Allan", 4),
(9, "Richard", "Brown", 5),
(10, "Stewart", "Duncan", 5);

CREATE TABLE project 
(
    project_id 		INT 			PRIMARY KEY		NOT NULL,
    project_name 	VARCHAR(255)	NULL,
    launch_date 	DATE			NULL,
    state_id 		INT				NULL,    
    FOREIGN KEY (state_id) 
    REFERENCES projectstate(state_id)
);

INSERT INTO project VALUES
(1, "First Fantasy", "2023-12-05", "1"),
(2, "City Fighter", "2023-12-15", "1"),
(3, "Night of Forts", "2024-1-12", "2"),
(4, "Zombie Survivors", "2024-1-17", "2"),
(5, "Full Life", "2025-12-31", "3");


CREATE TABLE storefront 
(
    storefront_id 		INT 			PRIMARY KEY		NOT NULL,
    project_id 			INT 			NULL,
    inventory_quanity 	INT 			NULL,
    price 				DECIMAL(9,2) 	NULL,
	FOREIGN KEY (project_id) 
    REFERENCES project(project_id)
);

INSERT INTO storefront VALUES
(1, 1, 30, "70.00"),
(2, 2, 30, "60.00"),
(3, 3, 60, "10.00"),
(4, 4, 60, "15.00"),
(5, 5, 0, "30.00");

UPDATE storefront
SET inventory_quanity = '100', price= '60.00'
WHERE project_id = 1;

SELECT employee.employee_id, employee.firstName, employee.lastName, jobrole.role_type
FROM employee
JOIN jobrole 
ON employee.job_id = jobrole.job_id;

SELECT project.project_id, project.project_name, project.launch_date, storefront.inventory_quanity, storefront.price
FROM project
JOIN storefront 
ON project.project_id = storefront.project_id;