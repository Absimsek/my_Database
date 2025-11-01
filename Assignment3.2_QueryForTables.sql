
CREATE TABLE Manufacturer (
    Name VARCHAR(200) PRIMARY KEY,
    Country VARCHAR(100),
    SalesRepName VARCHAR(200),
    SalesRepNumber VARCHAR(50)
);


CREATE TABLE Car (
    SerialNumber VARCHAR(100) PRIMARY KEY,
    Model VARCHAR(100),
    Year INT,
    Class VARCHAR(50),
    ManufacturerName VARCHAR(200) NOT NULL,
    FOREIGN KEY (ManufacturerName) REFERENCES Manufacturer(Name)
);


CREATE TABLE MaintenanceEvent (
    RepairNumber INT PRIMARY KEY,
    CarSerialNumber VARCHAR(100) NOT NULL,
    Date DATE,
    _Procedure VARCHAR(200),
    Mileage INT,
    RepairTime DECIMAL(10,2),
    FOREIGN KEY (CarSerialNumber) REFERENCES Car(SerialNumber)
);


CREATE TABLE Customer (
    CustomerNumber INT PRIMARY KEY,
    CustomerName VARCHAR(200),
    Address VARCHAR(300),
    CreditRating VARCHAR(20)
);


CREATE TABLE Rental (
    CarSerialNumber VARCHAR(100),
    CustomerNumber INT,
    RentalDate DATE,
    ReturnDate DATE,
    TotalCost DECIMAL(12,2),
    PRIMARY KEY (CarSerialNumber, CustomerNumber),
    FOREIGN KEY (CarSerialNumber) REFERENCES Car(SerialNumber),
    FOREIGN KEY (CustomerNumber) REFERENCES Customer(CustomerNumber)
);
