/*
Veterinary Practice Database 
Michael Clarke
G00411256@atu.ie
*/
CREATE TABLE `Owner` (
  `ownerID` varchar(50) NOT NULL,
  `ownerLastName` varchar(50) NOT NULL,
  `ownerFirstName` varchar(50) NOT NULL,
  `addressLine1` varchar(50) NOT NULL,
  `addressLine2` varchar(50) DEFAULT NULL,
  `town` varchar(50) NOT NULL,
  `county` varchar(50) NOT NULL,
  `eirCode` varchar(15) DEFAULT NULL,
  `phoneNo` varchar(50) NOT NULL,
  PRIMARY KEY (`ownerID`)
);

INSERT INTO Owner (`ownerID`, `ownerLastName`, `ownerFirstName`, `addressLine1`, `addressLine2`, `town`, `county`, `eirCode`, `phoneNo`) VALUES
('own101', 'Clarke', 'Michael', 'Whitepark', 'Ballymacward', 'Ballinasloe', 'Galway', 'A00AA00', '087 1234567'),
('own102', 'Keane', 'Mary', '22 Sea Road', NULL, 'Galway City', 'Galway', 'A00BB00', '086 2234567'),
('own103', 'Heffernan', 'Mark', '101 New Castle Drive', 'New Castle', 'Galway City', 'Galway', 'Q00AA00', '083 3214567'),
('own104', 'Ward', 'Susan', '11 Cow Ave', 'Terryland', 'Galway City', 'Galway', 'Z00AA00', '087 3234569'),
('own105', 'Dwyer', 'William', '12 Drom Our', 'Knocknacarra', 'Galway City', 'Galway', 'X00AA00', '087 2334568'),
('own106', 'Timlin', 'Marie', '17 WillsBrook Drive', 'Headford Road', 'Galway City', 'Galway', 'C00CC00', '087 9994568'),
('own107', 'Hillary', 'Paddy', 'Curraghline', 'NULL', 'Sylaun', 'Galway', 'B00KK00', '087 4714568');

CREATE TABLE `Animal` (
  `animalID` varchar(50) NOT NULL,
  `animalName` varchar(50) DEFAULT NULL,
  `animalDOB` date NOT NULL,
  `animalType` varchar(50) NOT NULL,
  `animalBreed` varchar(50) DEFAULT NULL,
  `animalSex` varchar(50) NOT NULL,
  `animalWeightKG` decimal(10,2) NOT NULL,
  `ownerID` varchar(50) NOT NULL,
  PRIMARY KEY (`animalID`),
  FOREIGN KEY (`ownerID`) REFERENCES `Owner`(`ownerID`)
);

INSERT INTO Animal (`animalID`, `animalName`, `animalDOB`, `animalType`, `animalBreed`, `animalSex`, `animalWeightKG`, `ownerID`) VALUES
('ani101', 'Jasper', '2007-11-11', 'Dog', 'Lurcher', 'Male', 25.0, 'own101'),
('ani102', 'Mittens', '2015-09-11', 'Cat', 'Bengal', 'Female', 6.0, 'own102'),
('ani103', 'Bowie', '2019-05-11', 'Dog', 'Jack Russell Terrier', 'Female', 10.0, 'own103'),
('ani104', 'Oscar', '2012-03-11', 'Cat', 'Rag Doll', 'Male', 10.0, 'own104'),
('ani105', 'Hoppy', '2020-01-11', 'Rabbit', 'Flemish Giant', 'Male', 16.0, 'own105'),
('ani106', 'Ying', '2016-11-11', 'Cat', 'Siamese', 'Female', 4.5, 'own106'),
('ani107', 'Yang', '2016-11-11', 'Cat', 'Siamese', 'Female', 4.5, 'own106'),
('ani108', NULL, '2022-11-11', 'Cow', 'Friesian', 'Female', 46.0, 'own107'),
('ani109', NULL, '2020-07-11', 'Sheep', 'Suffolk', 'Female', 40.0, 'own107'),
('ani110', NULL, '2014-07-11', 'Horse', 'Clydesdale', 'Male', 50.0, 'own107');

CREATE TABLE `Staff` (
  `staffID` varchar(50) NOT NULL,
  `staffTitle` varchar(50) NOT NULL,
  `staffLastName` varchar(50) NOT NULL,
  `staffFirstName` varchar(50) NOT NULL,
  PRIMARY KEY (`staffID`)
);

INSERT INTO Staff (`staffID`, `staffTitle`, `staffLastName`, `staffFirstName`) VALUES
('staf101', 'Vet', 'ODonnel', 'Joe'),
('staf102', 'Vet', 'Kenny', 'Maria'),
('staf103', 'Vet', 'Hillary', 'Hellen'),
('staf104', 'Veterinary Nurse', 'Wallace', 'Ronan'),
('staf105', 'Veterinary Nurse', 'Cahill', 'Gerard'),
('staf106', 'Veterinary Nurse', 'Bolger', 'Emma');

CREATE TABLE `Appointment` (
  `appID` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `time` time(0) NOT NULL,
  `treatmentRoom` int(11) DEFAULT NULL,
  `reasonForApp` varchar(50) NOT NULL,
  `animalID` varchar(50) NOT NULL,
  `staffID` varchar(50) NOT NULL,
  PRIMARY KEY (`appID`),
  FOREIGN KEY (`animalID`) REFERENCES `Animal`(`animalID`),
  FOREIGN KEY (`staffID`) REFERENCES `Staff`(`staffID`)
);

INSERT INTO `Appointment` (`appID`, `date`, `time`, `treatmentRoom`, `reasonForApp`, `animalID`, `staffID`) VALUES 
('app001', '2023-05-05', '14:30:00', 1, 'Annual checkup and vaccination for Bowie', 'ani103', 'staf103'),
('app002', '2023-05-05', '15:00:00', 4, 'Jasper is coughing a lot -- owners are concerned', 'ani101', 'staf102'),
('app003', '2023-05-06', '10:00:00', 3, 'Mittens is ill', 'ani102', 'staf101'),
('app004', '2023-05-07', '10:00:00', 3, 'Mittens: blood results', 'ani102', 'staf101');

CREATE TABLE `Food` (
  `foodID` varchar(50) NOT NULL,
  `animalType` varchar(50) NOT NULL,
  `productName` varchar(50) NOT NULL,
  `dietaryDetails` varchar(50) DEFAULT NULL,
  `quantityInStock` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`foodID`)
);

INSERT INTO `Food` (`foodID`, `animalType`, `productName`, `dietaryDetails`, `quantityInStock`, `cost`) VALUES 
('foo101', 'Dog', 'Royal Canin', 'Large Breed', 25, 75.00),
('foo102', 'Dog', 'Royal Canin', 'Small Breed', 25, 75.00),
('foo103', 'Dog', 'Royal Canin', 'Medium Breed', 25, 75.00),
('foo104', 'Cat', 'Other Brand', 'Medium Breed', 25, 75.00),
('foo105', 'Cat', 'Other Brand', 'Small Breed', 25, 75.00);


CREATE TABLE `Medication` (
  `medID` varchar(50) NOT NULL,
  `medName` varchar(50) NOT NULL,
  `medCode` varchar(50) NOT NULL,
  `quantityInStock` int(11) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`medID`)
);

INSERT INTO `Medication` (`medID`, `medName`, `medCode`, `quantityInStock`, `cost`) VALUES 
('med101', 'Vaccine X', '12345', 50, 30.00),
('med102', 'Cardisure', '12346', 1000, 1.0),
('med103', 'Yumove', '1247', 1000, 1.0),
('med104', 'Cat Meds X', '12337', 1000, 1.0);


CREATE TABLE `Diagnosis` (
  `diagnosisID` varchar(50) NOT NULL,
  `diagnosisDescription` varchar(50) NOT NULL,
  `diagnosis` varchar(50) NOT NULL,
  `appID` varchar(50) NOT NULL,
  PRIMARY KEY (`diagnosisID`),
  FOREIGN KEY (`appID`) REFERENCES `Appointment` (`appID`)
);

INSERT INTO `Diagnosis` (`diagnosisID`, `diagnosisDescription`, `diagnosis`, `appID` )  VALUES
('dia101', 'Nothing bad found. Needs annual vax. Recommend dog food', 'Give dog the annual vax. Change diet to new food.', 'app001'),
('dia102', 'Heartheart murmur.', 'Did bood tests. Also prescribed medication: Cardisure', 'app002'),
('dia103', 'Mittens is ill.', 'Did bood tests -- wating for results', 'app003'),
('dia104', 'Mittens has x problem.', 'Prescribed cat meds', 'app004');

CREATE TABLE `Invoice` (
  `invoiceID` varchar(50) NOT NULL,
  `date` date NOT NULL,
  `professionalFees` decimal(10,2) NOT NULL,
  `diagnosisID` varchar(50) NOT NULL,
  PRIMARY KEY (`invoiceID`),
  FOREIGN KEY (`diagnosisID`) REFERENCES `Diagnosis`(`diagnosisID`)
);

INSERT INTO `Invoice` (`invoiceID`, `date`, `professionalFees`, `diagnosisID`) VALUES 
('inv101', '2023-05-05', 60.00, 'dia101'),
('inv102', '2023-05-05', 60.00, 'dia102'),
('inv103', '2023-05-06', 60.00, 'dia103'),
('inv104', '2023-05-07', 60.00, 'dia104');

CREATE TABLE `Payments` (
  `ownerID` varchar(50) NOT NULL,
  `invoiceID` varchar(50) NOT NULL,
  `paymentDate` date NOT NULL,
  `paymentMethod` varchar(50) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  PRIMARY KEY (`ownerID`, `invoiceID`),
  FOREIGN KEY (`ownerID`) REFERENCES `Owner`(`ownerID`),
  FOREIGN KEY (`invoiceID`) REFERENCES `Invoice`(`invoiceID`)
);

INSERT INTO `Payments` (`ownerID`, `invoiceID`, `paymentDate`, `paymentMethod`, `amount`) VALUES
('own103', 'inv101', '2023-05-05', 'Credit Card', 60.00),
('own101', 'inv102', '2023-05-05', 'Cash', 40.00),
('own102', 'inv103', '2023-05-08', 'Online Payment', 60.00),
('own102', 'inv104', '2023-05-08', 'Online Payment', 60.00); 

CREATE TABLE `SurgicalProcedure` (
  `procedureID` varchar(50) NOT NULL,
  `procedureName` varchar(50) NOT NULL,
  `cost` decimal(10,2) NOT NULL,
  PRIMARY KEY (`procedureID`)
);

INSERT INTO `SurgicalProcedure` (`procedureID`, `procedureName`, `cost`) VALUES
('pro101', 'Blood Test', 100.00);

CREATE TABLE `Diagnosis_Food` (
  `diagnosisID` varchar(50) NOT NULL,
  `foodID` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`diagnosisID`, `foodID`),
  FOREIGN KEY (`diagnosisID`) REFERENCES `Diagnosis`(`diagnosisID`),
  FOREIGN KEY (`foodID`) REFERENCES `Food`(`foodID`)
);

INSERT INTO `Diagnosis_Food` (`diagnosisID`, `foodID`, `description`) VALUES
('dia101', 'foo102', 'Food for Bowie');

CREATE TABLE `Diagnosis_Medication` (
  `diagnosisID` varchar(50) NOT NULL,
  `medID` varchar(50) NOT NULL,
  `prescription` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`diagnosisID`, `medID`),
  FOREIGN KEY (`diagnosisID`) REFERENCES `Diagnosis`(`diagnosisID`),
  FOREIGN KEY (`medID`) REFERENCES `Medication`(`medID`)
);

INSERT INTO `Diagnosis_Medication` (`diagnosisID`, `medID`, `prescription`, `amount`) VALUES
('dia101', 'med101', 'Annual vax for small breed dog', 1),
('dia102', 'med102', 'Take one pill once a day before food.', 30),
('dia104', 'med104', 'Take one pill once a day before food.', 30);

CREATE TABLE `Diagnosis_Procedure` (
  `diagnosisID` varchar(50) NOT NULL,
  `procedureID` varchar(50) NOT NULL,
  `description` varchar(50) NOT NULL,
  PRIMARY KEY (`diagnosisID`, `procedureID`),
  FOREIGN KEY (`diagnosisID`) REFERENCES `Diagnosis`(`diagnosisID`),
  FOREIGN KEY (`procedureID`) REFERENCES `SurgicalProcedure`(`procedureID`)
);

INSERT INTO `Diagnosis_Procedure` (`diagnosisID`, `procedureID`, `description`) VALUES
('dia102', 'pro101', 'Blood test for Jasper. Checking heart murmur'),
('dia103', 'pro101', 'Blood test for Mittens. Checking for condition x');