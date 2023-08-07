CREATE TABLE Customer (
    driver_id INT PRIMARY KEY,
    name VARCHAR(255),
    address VARCHAR(255));

CREATE TABLE Car (
    license VARCHAR(255) PRIMARY KEY,
    model VARCHAR(255),
    year INT,
    driver_id INT,
    FOREIGN KEY (driver_id) REFERENCES Customer(driver_id));

CREATE TABLE Accident (
    report_number INT PRIMARY KEY,
    location VARCHAR(255),
    date DATE,
    damage_amount DECIMAL(10,2),
    license VARCHAR(255),
    FOREIGN KEY (license) REFERENCES Car(license));
    
    CREATE TABLE accident_owner(
    driver_id INT,
    license varchar(20),
    report_number INT,
    damage_amount INT,
    PRIMARY KEY(driver_id,license,report_number),
    FOREIGN KEY(driver_id) REFERENCES customer(driver_id),
    FOREIGN KEY(license) REFERENCES car(license),
    FOREIGN KEY(report_number) REFERENCES accident(report_number));