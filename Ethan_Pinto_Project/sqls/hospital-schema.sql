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
	payment_id      INT PRIMARY KEY,
	invoice_id		INT NOT NULL,
	patient_id		INT NOT NULL,
	payment_date	DATE NOT NULL,
	payment_amt     DECIMAL(10,2)   NOT NULL,
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
