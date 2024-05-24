
--creating product tables
CREATE TABLE Products (
	ID INT PRIMARY KEY IDENTITY(1,1),
	ProductName NVARCHAR(100)
)


--inserting test data for products
INSERT INTO Products VALUES
('YAMAHA PACIFICA-012'),
('YAMAHA p-45 '),
('Casio CDP-S110')

--creating a category table
CREATE TABLE Categories (
	ID INT PRIMARY KEY IDENTITY(1,1),
	CategoryName NVARCHAR(100)
)
--inserting test data for the category table
INSERT INTO Categories VALUES
('Musical instruments'),
('Guitars'),
('Keyboards')

-- creating a table-magazine product category, this table is a kind of magazine, because it is a many-to-many relationship
CREATE TABLE ProductCategories (
	ProductID INT FOREIGN KEY REFERENCES Products(ID),
	CategoryID INT FOREIGN KEY REFERENCES Categories(ID),
	PRIMARY KEY (ProductID, CategoryID))

--inserting data into a log table
INSERT INTO ProductCategories VALUES
(1,1),
(1,2),
(2,1),
(2,3),
(3,1),
(3,3)

--sampling by condition
select p.ProductName, c.CategoryName
from Products as P
LEFT JOIN ProductCategories as PC
	ON P.ID = PC.ProductID
LEFT JOIN Categories as C
	ON PC.CategoryID = C.ID
