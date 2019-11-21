--create a db

CREATE DATABASE db_library;
GO
USE db_library;
GO

--throw some tbales in there!

CREATE TABLE tbl_LibraryBranch (
	LB_BranchID INT NOT NULL PRIMARY KEY IDENTITY (0,1),
	LB_BranchName VARCHAR(30) NOT NULL,
	LB_Address VARCHAR(50) NOT NULL
);

CREATE TABLE tbl_Publisher (
	P_PublisherName VARCHAR(20) NOT NULL PRIMARY KEY,
	P_Address VARCHAR(50) NOT NULL,
	P_Phone VARCHAR(12)
);

CREATE TABLE tbl_Books (
	B_BookID INT NOT NULL PRIMARY KEY IDENTITY (1000,1),
	B_Title VARCHAR(50) NOT NULL,
	B_PublisherName VARCHAR(20) NOT NULL 
		CONSTRAINT fk_PublisherName
		FOREIGN KEY REFERENCES tbl_Publisher(P_PublisherName)
		ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE tbl_BookAuthors (
	BA_BookID INT NOT NULL 
		CONSTRAINT fk_BookID
		FOREIGN KEY REFERENCES tbl_Books(B_BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BA_AuthorName VARCHAR(50)
);

CREATE TABLE tbl_BookCopies (
	BC_BookID INT NOT NULL 
		CONSTRAINT fk_BookID_2
		FOREIGN KEY REFERENCES tbl_Books(B_BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BC_BranchID INT NOT NULL
		CONSTRAINT fk_BranchID
		FOREIGN KEY REFERENCES tbl_LibraryBranch(LB_BranchID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BC_NumberOfCopies INT
);

CREATE TABLE tbl_Borrower (
	Bo_CardNo BIGINT NOT NULL PRIMARY KEY IDENTITY (123456789000,1),
	Bo_Name VARCHAR(80) NOT NULL,
	Bo_Address VARCHAR(50) NOT NULL,
	Bo_Phone VARCHAR(12)
);

CREATE TABLE tbl_BookLoans (
	BL_BookID INT NOT NULL
		CONSTRAINT fk_BookID_3
		FOREIGN KEY REFERENCES tbl_Books(B_BookID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BL_BranchID INT NOT NULL
		CONSTRAINT fk_BranchID_3
		FOREIGN KEY REFERENCES tbl_LibraryBranch(LB_BranchID)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BL_CardNo BIGINT NOT NULL
		CONSTRAINT fk_CardNo
		FOREIGN KEY REFERENCES tbl_Borrower(Bo_CardNo)
		ON UPDATE CASCADE ON DELETE CASCADE,
	BL_DateOut DATE,
	BL_DateDue DATE
);

--get those tables some data!


DELETE FROM tbl_LibraryBranch WHERE LB_BranchID>3;

INSERT INTO tbl_LibraryBranch
VALUES
	('Sharpstown', '123 Main St'),
	('Central', '456 Elm St'),
	('Bleektor', '555 Grab Ave.'),
	('Borktown', '789 Blop Rd');
SELECT * FROM tbl_LibraryBranch;

INSERT INTO tbl_Publisher
VALUES
	('A Company Publisher', '456 Ocean St', '555-123-7894'),
	('ACME', '123 Turtle Dr', '123-456-7890');
SELECT * FROM tbl_Publisher;


INSERT INTO tbl_Books
VALUES
	('Hustle', 'A Company Publisher'),
	('IT', 'ACME'),
	('Templar Knight''s', 'ACME'),
	('The King', 'A Company Publisher'),
	('King Kong', 'A Company Publisher'),
	('Godzilla', 'ACME'),
	('How to be Great', 'ACME'),
	('KnightsFall', 'A Company Publisher'),
	('Lift', 'ACME'),
	('The Dark Crystal', 'A Company Publisher'),
	('Halloween', 'ACME'),
	('300', 'ACME'),
	('Gladiator', 'A Company Publisher'),
	('Conan the Destroyer', 'ACME'),
	('Fight Club', 'A Company Publisher'),
	('Jeepers Creeper', 'A Company Publisher'),
	('Pet Cemetary', 'A Company Publisher'),
	('The Mist', 'ACME'),
	('DeadPool', 'A Company Publisher'),
	('The Lost Tribe', 'ACME');
SELECT * FROM tbl_Books;

INSERT INTO tbl_BookAuthors
VALUES
	(1000,'Tom Clancy'),
	(1001,'Ammon Rubini'),
	(1002,'Ammon Rubini'),
	(1003,'Tom Clancy'),
	(1004,'Tom Clancy'),
	(1005,'Frank Miller'),
	(1006,'Frank Miller'),
	(1007,'Stephen King'),
	(1008,'Ammon Rubini'),
	(1009,'Ammon Rubini'),
	(1010,'Tom Clancy'),
	(1011,'Frank Miller'),
	(1012,'Frank Miller'),
	(1013,'Tom Clancy'),
	(1014,'Tom Clancy'),
	(1015,'Ammon Rubini'),
	(1016,'Ammon Rubini'),
	(1017,'Stephen King'),
	(1018,'Stephen King'),
	(1019,'Frank Miller');
SELECT * FROM tbl_BookAuthors;

INSERT INTO tbl_BookCopies
VALUES
	--Sharpstown
	(1000,0,6),
	(1001,0,3),
	(1002,0,0),
	(1003,0,5),
	(1004,0,3),
	(1005,0,5),
	(1006,0,65),
	(1007,0,23),
	(1008,0,75),
	(1009,0,7),
	--Central
	(1010,1,4),
	(1011,1,6),
	(1012,1,6),
	(1013,1,33),
	(1014,1,2),
	(1015,1,55),
	(1016,1,64),
	(1017,1,234),
	(1018,1,1),
	(1019,1,7),
	--Bleektor
	(1000,2,4),
	(1001,2,644),
	(1002,2,66),
	(1003,2,33),
	(1004,2,24),
	(1005,2,5),
	(1006,2,6),
	(1007,2,2),
	(1008,2,17),
	(1009,2,77),
	--Borktown
	(1010,3,4),
	(1011,3,6),
	(1012,3,0),
	(1013,3,3),
	(1014,3,1),
	(1015,3,0),
	(1016,3,6),
	(1017,3,2),
	(1018,3,0),
	(1019,3,7);
SELECT * FROM tbl_BookCopies;

INSERT INTO tbl_Borrower
VALUES
	('Mickey Mouse', 'DisneyLand', '999-999-9999'),
	('Luke Skywalker', 'Polis Massa', '123-456-7890'),
	('Darth Vader', 'Mustafar', '354-859-6596'),
	('Big Foot', 'The Forest', '000-000-0000'),
	('King Kong', 'Skull Island','333-333-3331'),
	('Alexander the Great', 'The World', '111-111-1111'),
	('leonidas', 'The Hot Gates', '999-555-0000'),
	('Conan', 'Krum', '958-959-9696'),
	('Tai Lopez', 'Anywhere I want!', '555-555-5555');
SELECT * FROM tbl_Borrower;

INSERT INTO tbl_BookLoans
VALUES
	(1017, 0, 123456789000, '02/27/2018', '10/31/2018'),
	(1007, 0, 123456789000, '02/27/2018', '10/31/2018'),
	(1011, 0, 123456789000, '02/27/2018', '10/31/2018'),
	(1014, 0, 123456789000, '02/27/2018', '10/31/2018'),
	(1000, 1, 123456789001, '10/31/2018', '02/10/2019'),
	(1003, 1, 123456789001, '10/31/2018', '02/10/2019'),
	(1014, 1, 123456789001, '10/31/2018', '02/10/2019'),
	(1005, 1, 123456789001, '10/31/2018', '02/10/2019'),
	(1017, 1, 123456789001, '10/31/2018', '02/10/2019'),
	(1001, 1, 123456789001, '10/31/2018', '02/10/2019'),
	(1019, 2, 123456789002, '09/01/2019', '09/30/2019'),
	(1006, 2, 123456789002, '09/01/2019', '09/30/2019'),
	(1008, 2, 123456789002, '09/01/2019', '09/30/2019'),
	(1012, 2, 123456789002, '09/01/2019', '09/30/2019'),
	(1014, 2, 123456789002, '09/01/2019', '09/30/2019'),
	(1005, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1001, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1008, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1012, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1014, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1000, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1005, 3, 123456789003, '08/20/2019', '09/15/2019'),
	(1001, 1, 123456789004, '08/15/2019', '09/30/2019'),
	(1007, 1, 123456789004, '08/15/2019', '09/30/2019'),
	(1014, 1, 123456789004, '08/15/2019', '09/30/2019'),
	(1005, 1, 123456789004, '08/15/2019', '09/30/2019'),
	(1014, 1, 123456789004, '08/15/2019', '09/30/2019'),
	(1013, 2, 123456789005, '07/25/2019', '08/30/2019'),
	(1016, 2, 123456789005, '07/25/2019', '08/30/2019'),
	(1017, 2, 123456789005, '07/25/2019', '08/30/2019'),
	(1002, 2, 123456789005, '07/25/2019', '08/30/2019'),
	(1000, 2, 123456789005, '07/25/2019', '08/30/2019'),
	(1017, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1015, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1003, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1002, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1006, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1000, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1005, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1011, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1004, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1019, 0, 123456789006, '04/25/2018', '2019-09-08'),
	(1013, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1009, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1012, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1018, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1003, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1002, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1004, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1008, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1001, 3, 123456789007, '10/13/2016', '2019-09-07'),
	(1014, 3, 123456789007, '10/13/2016', '2019-09-07');
SELECT * FROM tbl_BookLoans

