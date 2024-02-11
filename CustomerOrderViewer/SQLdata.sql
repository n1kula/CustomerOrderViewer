CREATE DATABASE CustomerOrderViewer;

USE CustomerOrderViewer;

CREATE TABLE [dbo].[Customer] (
	CustomerId INT IDENTITY(1, 1) NOT NULL,
	FirstName VARCHAR(50) NOT NULL,
	LastName VARCHAR(50) NOT NULL,
	Age INT NOT NULL,
	PRIMARY KEY (CustomerId)
);

CREATE TABLE [dbo].Item (
	ItemId INT IDENTITY(1, 1) NOT NULL,
	Description VARCHAR(100) NOT NULL,
	Price DECIMAL(4, 2) NOT NULL,
	PRIMARY KEY (ItemId)
);

CREATE TABLE [dbo].[CustomerOrder] (
	CustomerOrderID INT IDENTITY(1,1) NOT NULL,
	CustomerId INT NOT NULL,
	ItemId INT NOT NULL,
	PRIMARY KEY (CustomerOrderID),
	FOREIGN KEY (CustomerId) REFERENCES Customer(CustomerId),
	FOREIGN KEY (ItemId) REFERENCES Item(ItemId),
);

INSERT INTO [Customer] (FirstName, LastName, Age) VALUES ('Jan', 'Kowalski', 30);
INSERT INTO [Customer] (FirstName, LastName, Age) VALUES ('Michal', 'Nowak', 25);
INSERT INTO [Customer] (FirstName, LastName, Age) VALUES ('Ada', 'Osowska', 35);

INSERT INTO [Item]	(Description, Price) VALUES ('Coca Cola', 4.99);
INSERT INTO [Item]	(Description, Price) VALUES ('Fanta', 4.89);
INSERT INTO [Item]	(Description, Price) VALUES ('Sprite', 4.79);
INSERT INTO [Item]	(Description, Price) VALUES ('Pepsi', 4.69);
INSERT INTO [Item]	(Description, Price) VALUES ('Zywiec zdroj', 2.99);
INSERT INTO [Item]	(Description, Price) VALUES ('Duracell AA', 14.99);

INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (1, 1);
INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (1, 2);
INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (1, 5);
INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (2, 3);
INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (2, 5);
INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (3, 4);
INSERT INTO	[CustomerOrder] (CustomerId, ItemId) VALUES (1, 1);


