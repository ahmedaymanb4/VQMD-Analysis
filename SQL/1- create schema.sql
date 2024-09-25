CREATE DATABASE IF NOT EXISTS depi_final_project;
USE depi_final_project;

-- Create Vendors table
CREATE TABLE IF NOT EXISTS Vendors (
    Vendor_ID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Materials table
CREATE TABLE IF NOT EXISTS Materials (
    Material_ID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Defects table
CREATE TABLE IF NOT EXISTS Defects (
    Defect_ID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Plants table
CREATE TABLE IF NOT EXISTS Plants (
    Plant_ID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Categories table
CREATE TABLE IF NOT EXISTS Categories (
    Sub_Cat_ID INT PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Create Defect_Types table
CREATE TABLE IF NOT EXISTS Defect_Types (
    D_Type_ID INT PRIMARY KEY,
    sort INT,
    D_ID INT,
    FOREIGN KEY (D_ID) REFERENCES Defects(Defect_ID)
);

-- Create Defect_Items table
CREATE TABLE IF NOT EXISTS Defect_Items (
    Date DATE NOT NULL,
    Sub_Cat_ID INT,
    P_ID INT,
    V_ID INT,
    -- M_ID INT, -- I don't know their reference
    D_ID INT,
    M_Type_ID INT,
    Defect_ID INT,
    Defect_qty INT,
    Downtime_min INT,
    FOREIGN KEY (Sub_Cat_ID) REFERENCES Categories(Sub_Cat_ID),
    FOREIGN KEY (P_ID) REFERENCES Plants(Plant_ID),
    FOREIGN KEY (V_ID) REFERENCES Vendors(Vendor_ID),
    FOREIGN KEY (D_ID) REFERENCES Defects(Defect_ID),
    FOREIGN KEY (M_Type_ID) REFERENCES Defect_Types(D_Type_ID),
    FOREIGN KEY (Defect_ID) REFERENCES Defects(Defect_ID)
);
