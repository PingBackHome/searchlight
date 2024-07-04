CREATE TABLE Customers (
    CustomerID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    Address VARCHAR(255),
    ContactEmail VARCHAR(255)
);

CREATE TABLE Vendors (
    VendorID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL
);

CREATE TABLE Products (
    ProductID SERIAL PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    VendorID INT NOT NULL,
    FOREIGN KEY (VendorID) REFERENCES Vendors(VendorID)
);

CREATE TABLE Versions (
    VersionID SERIAL PRIMARY KEY,
    ProductID INT NOT NULL,
    VersionNumber VARCHAR(50) NOT NULL,
    ReleaseDate DATE,
    SupportEndDate DATE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

CREATE TABLE CustomerProducts (
    CustomerProductID SERIAL PRIMARY KEY,
    CustomerID INT NOT NULL,
    ProductID INT NOT NULL,
    VersionID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID),
    FOREIGN KEY (VersionID) REFERENCES Versions(VersionID)
);
