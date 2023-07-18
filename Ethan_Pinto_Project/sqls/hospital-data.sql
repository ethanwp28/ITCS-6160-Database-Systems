-- Insert data into tables
INSERT INTO patient(patient_id, patient_name, phone_number, street_address, city, state, zip) VALUES
  (1,"Lars Duke","(438) 773-5698","1009 A, Rd.","Fort Smith","AR","71838"),
  (2,"Shea Avery","(753) 836-7711","100-6214 Molestie Ave","Lawton","OK","87208"),
  (3,"Melinda Fletcher","(430) 633-8335","782-1469 Vel, Rd.","Tucson","AZ","85344"),
  (4,"Susan Pace","(496) 727-6410","Ap #751-4072 Ornare St.","Chandler","AZ","85847"),
  (5,"Melissa Knowles","(513) 715-2364","721-7427 At Street","Portland","OR","56393");

INSERT INTO physician(physician_id, physician_name, certification_number, physician_field, phone_number, street_address, city, state, zip) VALUES
  (11,"Venus Bradley",276,"Opthamology","(844) 593-7201","1760 Nunc St.","Erie","PA","88771"),
  (12,"Alexander Lopez",266,"Pediatrics","(603) 262-5111","P.O. Box 245, 1435 Fusce Av.","San Antonio","TX","58983"),
  (13,"Whitney Henry",630,"Radiology","(293) 455-5416","577-1141 Purus. Road","Houston","TX","12592"),
  (14,"Brock Walls",905,"General Practice","(732) 838-2211","Ap #368-9664 Mi St.","Lowell","MA","83938"),
  (15,"Moses Williamson",433,"Anesthesiology","(682) 575-4767","Ap #217-5013 Blandit Av.","Toledo","OH","37665");
  
INSERT INTO nurse(nurse_id, nurse_name, certification_number, phone_number, street_address, city, state, zip) VALUES
  (21,"Aquila Palmer",943,"(939) 655-6652","495-1834 Fringilla Rd.","St. Petersburg","FL","34155"),
  (22,"Rhonda Ballard",76,"(453) 733-5621","5867 Turpis Rd.","Stamford","CT","58159"),
  (23,"Ifeoma Ryan",557,"(524) 899-1816","Ap #657-2353 Viverra. Ave","Mobile","AL","36055"),
  (24,"Joseph Webb",844,"(237) 244-2691","335-9663 Integer Ave","Essex","VT","56010"),
  (25,"Griffith Hoffman",690,"(138) 352-0832","707-6874 Mollis Avenue","Provo","UT","85954");

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
  (2001,1,"2023-06-18", 'Migraine', 'Open', 'Patient suffering from severe migraines'),
  (2002,2,"2023-06-20", 'Strep Throat', 'Open', 'Patient has sore throat and flu like symptoms'),
  (2003,3,"2023-06-20", 'Broken Arm', 'Open', 'Patient has intense arm pain'),
  (2004,4,"2023-06-13", 'Sprained Ankle', 'Closed', 'Patient is unable to walk due to ankle pain'),
  (2005,5,"2023-06-11", 'Laceration', 'Open', 'Patient has a deep cut on hand');  

INSERT INTO instruction(instruction_id, instruction_fee, instruction_desc) VALUES
  (201,"853.36", 'Administer medicine, patient has severe migraines'),
  (202,"235.44", 'Administer medicine, patient has a bacterial infection'),
  (203,"565.23", 'Administer medicine, patient has a broken arm'),
  (204,"225.90", 'Refer to specialist'),
  (205,"696.77", 'Administer stitches to laceration');

INSERT INTO executesOrder(nurse_id, patient_id, instruction_id, execute_date, order_status) VALUES
	(23,1,201,"2023-06-05",'Completed'),
	(25,2,202,"2023-06-12",'Outstanding'),
	(21,3,203,"2023-06-15",'Completed'),
	(22,4,204,"2023-06-19",'Completed'),
	(24,5,205,"2023-06-08",'Completed');
  
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
(22,1001,1),
(21,1002,2),
(23,1003,3),
(24,1004,4),
(25,1005,5);


INSERT INTO physicianInstructs(physician_id, instruction_id, medication_id, patient_id) VALUES
(11,201,1001,1),
(12,202,1002,2),
(13,203,1003,3),
(14,204,1004,4),
(15,205,1005,5);