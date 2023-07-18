-- ITCS 6160 Term Project - Ethan Pinto

-- Create Hostpial DB

DROP DATABASE IF EXISTS hospital;
CREATE DATABASE hospital;
USE hospital;

-- Drop Tables
DROP TABLE IF EXISTS administerMedicine;
DROP TABLE IF EXISTS exexutesOrder;
DROP TABLE IF EXISTS physicianInstructs;
DROP TABLE IF EXISTS physicianMonitors;
DROP TABLE IF EXISTS patientHospitalized;
DROP TABLE IF EXISTS healthRecord;
DROP TABLE IF EXISTS payment;
DROP TABLE IF EXISTS invoice;
DROP TABLE IF EXISTS instruction;
DROP TABLE IF EXISTS medication;
DROP TABLE IF EXISTS room;
DROP TABLE IF EXISTS nurse;
DROP TABLE IF EXISTS physician;
DROP TABLE IF EXISTS patient;

-- Create Tables
CREATE TABLE patient (
  patient_id        INT            PRIMARY KEY,
  patient_name      VARCHAR(255)   NOT NULL,     
  phone_number		VARCHAR(255)   NOT NULL,
  street_address	VARCHAR(255)   NOT NULL,
  city 				VARCHAR(255)   NOT NULL,
  state 			VARCHAR(255)   NOT NULL,
  zip				INT			   NOT NULL
  
);

CREATE TABLE physician (
  physician_id        	INT            PRIMARY KEY,
  physician_name      	VARCHAR(255)   NOT NULL,
  certification_number	INT,
  physician_field 		VARCHAR(255)   NOT NULL,
  phone_number 			VARCHAR(255)   NOT NULL,
  street_address 		VARCHAR(255)   NOT NULL,
  city 					VARCHAR(255)   NOT NULL,
  state 				VARCHAR(255)   NOT NULL,
  zip 					VARCHAR(255)   NOT NULL
);

CREATE TABLE nurse (
  nurse_id        		INT            PRIMARY KEY,
  nurse_name      		VARCHAR(255)   NOT NULL,
  certification_number	INT,
  phone_number			VARCHAR(255)   NOT NULL,
  street_address		VARCHAR(255)   NOT NULL,
  city 					VARCHAR(255)   NOT NULL,
  state 				VARCHAR(255)   NOT NULL,
  zip 					VARCHAR(255)   NOT NULL
);

CREATE TABLE room (
  room_id       INT            PRIMARY KEY,
  capacity      VARCHAR(255)   NOT NULL,
  room_fee		DECIMAL(10,2)   NOT NULL
);

CREATE TABLE medication (
  medication_id        	INT            PRIMARY KEY,
  medication_name      	VARCHAR(255)   NOT NULL,
  medication_amt		INT
);

CREATE TABLE instruction (
  instruction_id        INT            	PRIMARY KEY,
  instruction_fee      	DECIMAL(10,2)   NOT NULL,
  instruction_desc		VARCHAR(255)   	NOT NULL
);

CREATE TABLE invoice (
  invoice_id INT PRIMARY KEY,
  invoice_amt DECIMAL(10, 2),
  invoice_date DATE,
  patient_id INT NOT NULL,
  instruction_id INT NOT NULL,
  room_id INT NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (instruction_id) REFERENCES instruction(instruction_id),
  FOREIGN KEY (room_id) REFERENCES room(room_id)
);

CREATE TABLE payment (
  payment_id        INT            	PRIMARY KEY,
  invoice_id		INT NOT NULL,
  patient_id		INT NOT NULL,
   payment_date		DATE   	NOT NULL,
	payment_amt      	DECIMAL(10,2)   NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (invoice_id) REFERENCES invoice(invoice_id)
);

CREATE TABLE healthRecord (
  record_id        INT            PRIMARY KEY,
  patient_id INT NOT NULL,
  record_date      DATE   NOT NULL ,
  disease VARCHAR(255)   NOT NULL,
  record_status VARCHAR(255)   NOT NULL,
  record_desc VARCHAR(255)   NOT NULL,
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE patientHospitalized (
  patient_id INT NOT NULL,
  room_id INT NOT NULL,
  nights INT,
  PRIMARY KEY (patient_id, room_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (room_id) REFERENCES room(room_id)
);

CREATE TABLE physicianMonitors (
  physician_id INT NOT NULL,
  patient_id INT NOT NULL,
  duration INT NOT NULL,
  PRIMARY KEY (physician_id, patient_id),
  FOREIGN KEY (physician_id) REFERENCES physician(physician_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE physicianInstructs (
  physician_id INT NOT NULL,
  instruction_id INT NOT NULL,
  medication_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (physician_id, instruction_id),
  FOREIGN KEY (physician_id) REFERENCES physician(physician_id),
  FOREIGN KEY (instruction_id) REFERENCES instruction(instruction_id),
  FOREIGN KEY (medication_id) REFERENCES medication(medication_ID),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id)
);

CREATE TABLE executesOrder (
  nurse_id INT NOT NULL,
  patient_id INT NOT NULL,
  instruction_id INT NOT NULL,
  execute_date DATE,
  order_status VARCHAR(255),
  PRIMARY KEY (nurse_id, patient_id, instruction_id),
  FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id),
  FOREIGN KEY (patient_id) REFERENCES patient(patient_id),
  FOREIGN KEY (instruction_id) REFERENCES instruction(instruction_id)
);

CREATE TABLE administerMedicine (
  nurse_id INT NOT NULL,
  medication_id INT NOT NULL,
  patient_id INT NOT NULL,
  PRIMARY KEY (nurse_id, medication_id),
  FOREIGN KEY (nurse_id) REFERENCES nurse(nurse_id),
  FOREIGN KEY (medication_id) REFERENCES medication(medication_id)
);

-- Insert data into tables
INSERT INTO patient(patient_id, patient_name, phone_number, street_address, city, state, zip) VALUES
  (1,"Lars Duke","(438) 773-5698","1009 A, Rd.","Fort Smith","AR","71838"),
  (2,"Shea Avery","(753) 836-7711","100-6214 Molestie Ave","Lawton","OK","87208"),
  (3,"Melinda Fletcher","(430) 633-8335","782-1469 Vel, Rd.","Tucson","AZ","85344"),
  (4,"Susan Pace","(496) 727-6410","Ap #751-4072 Ornare St.","Chandler","AZ","85847"),
  (5,"Melissa Knowles","(513) 715-2364","721-7427 At Street","Portland","OR","56393");

INSERT INTO physician(physician_id, physician_name, certification_number, physician_field, phone_number, street_address, city, state, zip) VALUES
  (15,"Venus Bradley",276,"Opthamology","(844) 593-7201","1760 Nunc St.","Erie","PA","88771"),
  (11,"Alexander Lopez",266,"Pediatrics","(603) 262-5111","P.O. Box 245, 1435 Fusce Av.","San Antonio","TX","58983"),
  (12,"Whitney Henry",630,"Radiology","(293) 455-5416","577-1141 Purus. Road","Houston","TX","12592"),
  (13,"Brock Walls",905,"General Practice","(732) 838-2211","Ap #368-9664 Mi St.","Lowell","MA","83938"),
  (14,"Moses Williamson",433,"Anesthesiology","(682) 575-4767","Ap #217-5013 Blandit Av.","Toledo","OH","37665");
  
INSERT INTO nurse(nurse_id, nurse_name, certification_number, phone_number, street_address, city, state, zip) VALUES
  (25,"Aquila Palmer",943,"(939) 655-6652","495-1834 Fringilla Rd.","St. Petersburg","FL","34155"),
  (21,"Rhonda Ballard",76,"(453) 733-5621","5867 Turpis Rd.","Stamford","CT","58159"),
  (22,"Ifeoma Ryan",557,"(524) 899-1816","Ap #657-2353 Viverra. Ave","Mobile","AL","36055"),
  (23,"Joseph Webb",844,"(237) 244-2691","335-9663 Integer Ave","Essex","VT","56010"),
  (24,"Griffith Hoffman",690,"(138) 352-0832","707-6874 Mollis Avenue","Provo","UT","85954");

INSERT INTO room(room_id, capacity, room_fee) VALUES
  (100,'N',"146.93"),
  (101,'N',"266.76"),
  (102,'N',"103.91"),
  (103,'N',"191.31"),
  (104,'N',"292.22"),
  (105,'Y',"120.26"),
  (106,'Y',"187.48"),
  (107,'Y',"190.34"),
  (108,'Y',"226.54"),
  (109,'Y',"129.95");

INSERT INTO medication(medication_id, medication_name, medication_amt) VALUES
	(1001,'Acetaminophen', 200),
    (1002,'Amoxicillin', 400),
	(1003,'Ibuprofen', 800),
	(1004,'Hydrocodone', 200),
	(1005,'Ibuprofen', 400);

INSERT INTO healthRecord(record_id, patient_id, record_date, disease, record_status, record_desc) VALUES
  (2005,1,"2023-06-18", 'Migraine', 'Open', 'Patient suffering from severe migraines'),
  (2001,2,"2023-06-20", 'Strep Throat', 'Open', 'Patient has sore throat and flu like symptoms'),
  (2002,3,"2023-06-20", 'Broken Arm', 'Open', 'Patient has intense arm pain'),
  (2003,4,"2023-06-13", 'Sprained Ankle', 'Closed', 'Patient is unable to walk due to ankle pain'),
  (2004,5,"2023-06-11", 'Laceration', 'Open', 'Patient has a deep cut on hand');  

INSERT INTO instruction(instruction_id, instruction_fee, instruction_desc) VALUES
  (201,"853.36", 'Administer medicine, patient has severe migraines'),
  (202,"235.44", 'Administer medicine, patient has an infection'),
  (203,"565.23", 'Refer to specialist'),
  (204,"225.90", 'Administer medicine, patient has a broken arm'),
  (205,"696.77", 'Refer to specialist');

INSERT INTO executesOrder(nurse_id, patient_id, instruction_id, execute_date, order_status) VALUES
	(23,1,202,"2023-06-05",' '),
	(25,3,201,"2023-06-12",' '),
	(21,4,204,"2023-06-15",' '),
	(22,5,203,"2023-06-19",' '),
	(24,2,205,"2023-06-08",' ');
  
INSERT INTO physicianMonitors(physician_id, patient_id, duration) VALUES
(15,1,3),
(12,3,7),
(11,2,6),
(13,5,4),
(14,4,2);

INSERT INTO invoice(invoice_id, invoice_date, invoice_amt, patient_id, instruction_id, room_id) VALUES
  (3001,"2023-06-05","1409.94",1,201,100),
  (3002,"2023-06-07","1980.99",2,202,101),
  (3003,"2023-06-12","1462.09",3,203,102),
  (3004,"2023-06-10","1432.28",4,204,103),
  (3005,"2023-06-16","1414.80",5,205,104);

INSERT INTO payment(payment_id, patient_id, invoice_id, payment_date, payment_amt) VALUES
  (4001,1,3001,"2023-06-09","1074.11"),
  (4002,2,3002,"2023-06-08","1850.77"),
  (4003,3,3003,"2023-06-09","1674.50"),
  (4004,4,3004,"2023-06-20","0"),
  (4005,5,3005,"2023-06-13","1613.36");

INSERT INTO patientHospitalized(patient_id, room_id, nights) VALUES
  (1,100,9),
  (2,101,1),
  (3,102,3),
  (4,103,10),
  (5,104,7);
  
INSERT INTO administerMedicine(nurse_id, medication_id, patient_id) VALUES
(22,1002,5),
(21,1001,1),
(23,1004,2),
(24,1005,4),
(25,1003,3);


INSERT INTO physicianInstructs(physician_id, instruction_id, medication_id, patient_id) VALUES
(11,202,1001,3),
(12,204,1002,1),
(13,205,1003,4),
(14,201,1004,2),
(15,203,1005,5);

-- This view shows the breakdown of each patient's invoice
DROP VIEW IF EXISTS invoiceBreakdown;

CREATE VIEW invoiceBreakdown AS
SELECT p.patient_name, i.invoice_id, r.room_fee, instr.instruction_fee,
  (i.invoice_amt - r.room_fee - instr.instruction_fee) AS miscellaneous_expenses, i.invoice_amt
FROM invoice i
JOIN room r ON r.room_id = i.room_id
JOIN instruction instr ON instr.instruction_id = i.instruction_id
JOIN patient p ON p.patient_id = i.patient_id;

SELECT * FROM invoiceBreakdown;

-- This view gives a breakdown of each patient and their associated physician, nurse, and treatment plan, as well as the current status.
DROP VIEW IF EXISTS patientTreatment;

CREATE VIEW patientTreatment AS
SELECT p.patient_name, ph.physician_name, n.nurse_name,hr.disease, i.instruction_desc, m.medication_name, m.medication_amt, hr.record_status
FROM patient p
JOIN physicianInstructs pi ON pi.patient_id = p.patient_id
JOIN physician ph ON ph.physician_id = pi.physician_id
JOIN administerMedicine am ON am.patient_id = p.patient_id
JOIN medication m ON m.medication_id = am.medication_id
JOIN instruction i ON i.instruction_id = pi.instruction_id
JOIN nurse n ON n.nurse_id = am.nurse_id
JOIN healthRecord hr ON hr.patient_id = p.patient_id;

SELECT * FROM patientTreatment;
-- This view details the amount due that a patient may owe to the hospital, if any.
DROP VIEW IF EXISTS paymentRecord;

CREATE VIEW paymentRecord AS
SELECT
    p.patient_name,
    i.invoice_amt,
    pmt.payment_amt,
    CASE WHEN (i.invoice_amt - pmt.payment_amt) < 0 THEN 0 ELSE (i.invoice_amt - pmt.payment_amt) END AS amount_due
FROM
    patient p
    INNER JOIN invoice i ON p.patient_id = i.patient_id
    INNER JOIN payment pmt ON i.invoice_id = pmt.invoice_id;


SELECT * FROM paymentRecord;

-- Queries

-- Query to find which rooms are occupied and who occupies that room.
SELECT
    r.room_number,
    p.patient_name
FROM
    room r
    INNER JOIN patient p ON r.patient_id = p.patient_id
WHERE
    r.capacity = 'N';
  
-- Query to find which patients have not yet paid their invoice
SELECT *
FROM patients
WHERE patient_id NOT IN (
    SELECT patient_id
    FROM payments
    WHERE payment_amt > 0
);
    
-- Query to find the amount of past due payments    
SELECT COUNT(*) AS remaining_payments
FROM paymentRecord
WHERE amount_due > 0;

-- Query to find the total outstanding amount due to the hospital
SELECT SUM(amount_due) AS remaining_amt
FROM paymentRecord
WHERE amount_due > 0;

-- Query that shows which room each nurse treats each patient in
SELECT n.nurse_name, p.patient_name, r.room_id
FROM nurse n
JOIN administerMedicine am on n.nurse_id = am.nurse_id
JOIN patientHospitalized ph ON am.patient_id = ph.patient_id
JOIN patient p ON p.patient_id = ph.patient_id
JOIN room r ON ph.room_id = r.room_id;

-- Query that selects the longest amount of time a patient is staying at the hospital.
SELECT MAX(ph.nights) AS Nights
FROM  patientHospitalized ph;

-- Query that lists all hospital employees and their IDs
SELECT nurse_id, nurse_name
FROM nurse
UNION
SELECT physician_id, physician_name
FROM physician
;

-- Query that selects the average room fee in the hospital
SELECT AVG(room_fee) AS Average_Cost
FROM room;

-- Query that shows which nurses administer Hydrocodone
SELECT nurse_id, nurse_name
FROM nurse
WHERE nurse_id IN (
    SELECT nurse_id
    FROM administerMedicine
    WHERE medication_id = (
        SELECT medication_id
        FROM medication
        WHERE medication_name = 'Hydrocodone'
    )
);

-- Query that shows how long each physician has been monitororing each patient
SELECT p.physician_name, pt.patient_name, pm.duration
FROM physician p
JOIN physicianMonitors pm ON p.physician_id = pm.physician_id
JOIN patient pt ON pt.patient_id = pm.patient_id;

-- Query that shows the patients that need further care from a specialist
SELECT *
FROM patient
WHERE patient_id IN (
    SELECT DISTINCT pi.patient_id
    FROM physicianInstructs pi
    JOIN instruction i ON pi.instruction_id = i.instruction_id
    WHERE i.instruction_desc LIKE '%specialist%'
);

-- Query that provides a list of vacant rooms
SELECT *
FROM room
WHERE capacity = 'Y';

-- Query that provides a list of patients that are instructed to be administered medicine by a physician
SELECT *
FROM patient
WHERE patient_id IN (
    SELECT DISTINCT pi.patient_id
    FROM physicianInstructs pi
    JOIN instruction i ON pi.instruction_id = i.instruction_id
    WHERE i.instruction_desc LIKE '%medicine%'
);

-- Query that shows when each patient began treatment
SELECT p.patient_id, p.patient_name, eo.execute_date
FROM patient p
JOIN executesOrder eo ON p.patient_id = eo.patient_id;

-- Query that shows patients that need continued treatment
SELECT * FROM healthRecord
WHERE record_status = 'Open';