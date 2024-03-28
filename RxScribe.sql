CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    Suffix VARCHAR(20),
    DateOfBirth DATE,
    SexAtBirth ENUM('Male', 'Female', 'Other'),
    ContactInformation VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    MiddleName VARCHAR(50),
    LastName VARCHAR(50),
    Suffix VARCHAR(20),
    Specialization VARCHAR(100),
    ContactInformation VARCHAR(100),
    Address VARCHAR(255)
);

CREATE TABLE Prescriptions (
    PrescriptionID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    DateIssued DATE,
    DateValidUntil DATE,
    Instructions TEXT,
    RequestID INT,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID),
    FOREIGN KEY (RequestID) REFERENCES PrescriptionRequests(RequestID)
);

CREATE TABLE Medications (
    MedicationID INT PRIMARY KEY,
    MedicationName VARCHAR(100),
    Dosage VARCHAR(50),
    Manufacturer VARCHAR(100),
    Description TEXT,
    SideEffects TEXT
);

CREATE TABLE PrescriptionRequests (
    RequestID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    RequestDate DATE,
    Status ENUM('pending', 'approved', 'declined'),
    Details TEXT, -- Field for patient-provided details
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE PrescribedMedications (
    PrescriptionID INT,
    MedicationID INT,
    Quantity INT,
    Frequency VARCHAR(50),
    FOREIGN KEY (PrescriptionID) REFERENCES Prescriptions(PrescriptionID),
    FOREIGN KEY (MedicationID) REFERENCES Medications(MedicationID),
    PRIMARY KEY (PrescriptionID, MedicationID)
);

CREATE TABLE DoctorPasswords (
    DoctorID INT PRIMARY KEY,
    PasswordHash VARCHAR(255),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE PatientPasswords (
    PatientID INT PRIMARY KEY,
    PasswordHash VARCHAR(255),
    LastUpdated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID)
);

ALTER TABLE Prescriptions
ADD COLUMN Quantity INT,
ADD COLUMN Frequency VARCHAR(255);
