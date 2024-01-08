-- Task B: SQL programming
-- Create Users table
CREATE TABLE Users (
    userId VARCHAR(50) PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    emailAddress VARCHAR(255) NOT NULL
);

INSERT ALL
  INTO Users VALUES ('simon3', 'Simon, S', 'simon3@hotmail.co.uk')
  INTO Users VALUES ('talia11', 'Talia, J', 'talia11@ntl.co.uk')
  INTO Users VALUES ('toby05', 'Toby, T', 'toby05@freeserve.co.uk')
  INTO Users VALUES ('marqot9', 'Marqot, C', 'marqot0@msn.co.uk')
  INTO Users VALUES ('ethan77', 'Ethan, R', 'ethan77@hotmail.co.uk')
  INTO Users VALUES ('nancy91', 'Nancy, L', 'nancy91@tesco.co.uk')
SELECT 1 FROM dual;

SELECT *  FROM Users;

-- Create Category table
CREATE TABLE Category (
    categoryCode VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL
);

-- Insert category data
INSERT ALL
  INTO Category VALUES ('MO11', 'Drama')
  INTO Category VALUES ('MO12', 'Fiction')
  INTO Category VALUES ('MO13', 'Biopic')
SELECT 1 FROM DUAL;

SELECT * FROM Category;

-- Create Movie table
CREATE TABLE Movie (
    movieId VARCHAR(50) PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    categoryCode VARCHAR(50) NOT NULL,
    costPerDownload DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (categoryCode) REFERENCES Category(categoryCode)
);

-- Insert Movie Data
INSERT ALL
  INTO Movie VALUES ('MOO1', 'The Imitation Game', 'MO13', 0.99)
  INTO Movie VALUES ('MOO2', 'The Duchess', 'MO13', 1.99)
  INTO Movie VALUES ('MOO3', 'The Trainspotting', 'MO11', 1.49)
  INTO Movie VALUES ('MOO4', 'The Dig', 'MO11', 1.79)
  INTO Movie VALUES ('MOO5', 'Elizabeth', 'MO13', 1.50)
  INTO Movie VALUES ('MOO6', 'Sherlock Holmes', 'MO12', 1.10)
  INTO Movie VALUES ('MOO7', 'Moon', 'MO12', 0.89)
SELECT 1 FROM DUAL;

SELECT * FROM Movie;


-- Create DownloadMovie table
CREATE TABLE DownloadMovie (
    userId VARCHAR(50),
    movieId VARCHAR(50),
    downloadDate DATE,
    PRIMARY KEY (userId, movieId),
    FOREIGN KEY (userId) REFERENCES Users(userId),
    FOREIGN KEY (movieId) REFERENCES Movie(movieId)
);

-- Insert DownloadMovie Data
INSERT ALL
  INTO DownloadMovie VALUES ('simon3', 'M002', TO_DATE('03-May-2021', 'DD-Mon-YYYY'))
  INTO DownloadMovie VALUES ('marqot9', 'M005', TO_DATE('01-May-2022', 'DD-Mon-YYYY'))
  INTO DownloadMovie VALUES ('talia11', 'M002', TO_DATE('06-May-2021', 'DD-Mon-YYYY'))
  INTO DownloadMovie VALUES ('marqot9', 'M001', TO_DATE('06-May-2022', 'DD-Mon-YYYY'))
  INTO DownloadMovie VALUES ('simon3', 'M003', TO_DATE('01-Aug-2022', 'DD-Mon-YYYY'))
  INTO DownloadMovie VALUES ('ethan77', 'M004', TO_DATE('02-Aug-2021', 'DD-Mon-YYYY'))
  INTO DownloadMovie VALUES ('nancy91', 'M007', TO_DATE('05-Sep-2021', 'DD-Mon-YYYY'))
SELECT 1 FROM DUAL;

SELECT * FROM DownloadMovie;


-- Task C: Sequential and distributed processing
CREATE TABLE Orders (
    OrderNo INTEGER,
    ProductNo INTEGER,
    Price REAL,
    Quantity INTEGER,
    Sales REAL,
    QtrId INTEGER CHECK (QtrId BETWEEN 1 AND 4),
    MonthId INTEGER CHECK (MonthId BETWEEN 1 AND 12),
    YearId INTEGER
);

INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10107, 2, 85.7, 30, 2587, 1, 2, 2003);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10107, 5, 95.8, 39, 3879.49, 1, 2, 2003);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10121, 5, 71.5, 34, 2700, 1, 2, 2003);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10134, 2, 94.74, 41, 3884.34, 3, 7, 2004);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10134, 5, 100, 27, 3307.77, 3, 7, 2004);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10159, 14, 100, 49, 5205.27, 4, 10, 2005);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10168, 1, 96.66, 36, 3479.66, 4, 10, 2006);
INSERT INTO Orders (OrderNo, ProductNo, Price, Quantity, Sales, QtrId, MonthId, yearId) VALUES (10180, 12, 100, 42, 4695.6, 4, 11, 2006);


Select * from Orders;

-- Task C a)
-- Assuming that the data is stored in a relational database produce, with justification, the SQL
-- code to determine, for each product, the number of products which were sold in each month
-- of each year
SELECT ProductNo, YearId, MonthId, COUNT(*) AS TotalProductsSold
FROM Orders
GROUP BY ProductNo, YearId, MonthId
ORDER BY ProductNo, YearId, MonthId;