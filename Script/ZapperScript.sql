CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    CustomerName NVARCHAR(100) NOT NULL,
    Email NVARCHAR(255) UNIQUE NOT NULL,
    Phone VARCHAR(15),
    CreatedAt DATETIME2 DEFAULT SYSDATETIME()
);

CREATE TABLE Merchants (
    MerchantID INT PRIMARY KEY IDENTITY(1,1),
    MerchantName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255),
    CreatedAt DATETIME2 DEFAULT SYSDATETIME(),
    INDEX IX_MerchantName (MerchantName)
);


CREATE TABLE Transactions (
    TransactionID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    MerchantID INT NOT NULL,
    Amount DECIMAL(10,2) NOT NULL,
    PaymentType VARCHAR(20),
    TransactionDate DATETIME2 DEFAULT SYSDATETIME(),
    INDEX IX_Transaction_Customer (CustomerID),
    INDEX IX_Transaction_Merchant (MerchantID),
    CONSTRAINT FK_Transaction_Customer 
        FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID),
    CONSTRAINT FK_Transaction_Merchant 
        FOREIGN KEY (MerchantID) REFERENCES Merchants(MerchantID)
);