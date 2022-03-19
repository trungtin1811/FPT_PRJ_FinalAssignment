CREATE DATABASE ShoppingManagement
GO
USE ShoppingManagement
GO

create table tblRoles (
	roleID varchar(10) primary key,
	roleName nvarchar(20),
	[status] bit,
)
GO
create table tblUsers (
	userID varchar(10) primary key,
	fullName nvarchar(50),
	roleID varchar(10),
	[password] varchar(20),
	[address] nvarchar(100),
	birthday date,
	phone char(10),
	email varchar(50),
	[status] bit,
)
GO
create table tblOrder (
	orderID int primary key identity(1,1),
	oderDate date,
	total money,
	userID varchar(10),
	[status] bit,
)
GO
create table tblCategory (
	categoryID varchar(10) primary key,
	categoryName char(50),
	[status] bit,
)
GO
create table tblProduct (
	productID varchar(10) primary key,
	productName nvarchar(50),
	[image] nvarchar(100),
	price money,
	quantity int,
	categoryID varchar(10), 
	importDate date,
	usingDate date,
	[status] bit,
)
GO
create table tblOrderDetail (
	detailID int primary key identity(1,1),
	price money,
	quantity int,
	orderID int, 
	productID varchar(10),
	[status] bit,
)
GO
ALTER TABLE tblUsers
ADD FOREIGN KEY (roleID) REFERENCES tblRoles (roleID)
ALTER TABLE tblOrder
ADD FOREIGN KEY (userID) REFERENCES tblUsers(userID)
ALTER TABLE tblOrderDetail 
ADD FOREIGN KEY (orderID) REFERENCES tblOrder(orderID)
ALTER TABLE tblOrderDetail 
ADD FOREIGN KEY (productID) REFERENCES tblProduct(productID)
ALTER TABLE tblProduct
ADD FOREIGN KEY (categoryID) REFERENCES tblCategory(categoryID)

GO

INSERT INTO tblRoles 
VALUES ('AD', 'ADMIN',1)
INSERT INTO tblRoles 
VALUES ('US', 'USER',1)
GO
INSERT INTO tblUsers 
VALUES ('admin', 'Toi la Admin', 'AD', '1', '', '','','',1)
INSERT INTO tblUsers 
VALUES ('user', 'Toi la User', 'US', '1', '', '','','',1)
GO
INSERT INTO tblCategory 
VALUES ('1', 'Fruit', 1)
GO
INSERT INTO tblProduct
VALUES ('P1', 'Strawberry', 'images/product1.jpg', 30000, 10, 1, '2022-01-01', '2022-02-14',1 )
INSERT INTO tblProduct
VALUES ('P2', 'Avocado', 'images/product2.jpg', 12000, 10, 1, '2022-01-01', '2022-02-14',1 )
INSERT INTO tblProduct
VALUES ('P3', 'Apple', 'images/product3.jpg', 20000, 10, 1, '2022-01-01', '2022-02-14',1 )

