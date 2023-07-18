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
SELECT r.room_id, r.capacity, p.patient_name
FROM room r
JOIN patientHospitalized ph ON r.room_id = ph.room_id
JOIN patient p ON ph.patient_id = p.patient_id;
  
-- Query to find which patients have not yet paid their invoice
SELECT patient_name
FROM patient
WHERE patient_id NOT IN (
    SELECT patient_id
    FROM payment
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
SELECT patient_name
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
SELECT patient_name
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