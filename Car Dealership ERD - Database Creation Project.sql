
CREATE DATABASE CarDealership;

USE CarDealership;

CREATE TABLE Customer (
  CustomerID INT PRIMARY KEY,
  FirstName VARCHAR(50),
  LastName VARCHAR(50),
  Email VARCHAR(50),
  PhoneNumber VARCHAR(15)
);

CREATE TABLE Car (
  CarID INT PRIMARY KEY,
  Make VARCHAR(50),
  Model VARCHAR(50),
  Year INT,
  Mileage INT,
  Price DECIMAL(10,2)
);

CREATE TABLE Order_ (
  OrderID INT PRIMARY KEY,
  OrderDate DATE,
  TotalPrice DECIMAL(10,2),
  CustomerID INT,
  FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE OrderDetail (
  OrderDetailID INT PRIMARY KEY,
  OrderID INT,
  CarID INT,
  Quantity INT,
  FOREIGN KEY (OrderID) REFERENCES Order_(OrderID),
  FOREIGN KEY (CarID) REFERENCES Car(CarID)
);

CREATE TABLE Service_ (
  ServiceID INT PRIMARY KEY,
  ServiceDate DATE,
  Mechanic VARCHAR(50),
  LaborCost DECIMAL(10,2)
);

CREATE TABLE ServiceDetail (
  ServiceDetailID INT PRIMARY KEY,
  ServiceID INT,
  CarID INT,
  ServiceType VARCHAR(50),
  Cost DECIMAL(10,2),
  FOREIGN KEY (ServiceID) REFERENCES Service_(ServiceID),
  FOREIGN KEY (CarID) REFERENCES Car(CarID)
);


INSERT INTO Customer (CustomerID, FirstName, LastName, Email, PhoneNumber)
VALUES (1, 'John', 'Doe', 'john.doe@example.com', '555-123-4567');

INSERT INTO Car (CarID, Make, Model, Year, Mileage, Price)
VALUES (1, 'Toyota', 'Camry', 2020, 10000, 25000.00);

INSERT INTO Order_ (OrderID, OrderDate, TotalPrice, CustomerID)
VALUES (1, '2023-01-01', 30000.00, 1);

INSERT INTO OrderDetail (OrderDetailID, OrderID, CarID, Quantity)
VALUES (1, 1, 1, 1);

INSERT INTO Service_ (ServiceID, ServiceDate, Mechanic, LaborCost)
VALUES (1, '2023-01-02', 'Jane Smith', 200.00);

INSERT INTO ServiceDetail (ServiceDetailID, ServiceID, CarID, ServiceType, Cost)
VALUES (1, 1, 1, 'Oil Change', 50.00);
