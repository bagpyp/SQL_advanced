CREATE PROC checkNoCopiesOfTheLostTribeAtSharpstown

	AS
		BEGIN

			--1.) How many copies of the book titled "The Lost Tribe" are owned by the library branch whose name is "Sharpstown"?

			DECLARE @bookTitle VARCHAR(50), @branchName VARCHAR(30);
			SET @bookTitle = 'The Lost Tribe';
			SET @branchName = 'Sharpstown'

			SELECT x.LB_BranchName as 'Branch', z.B_Title as 'Title', y.BC_NumberOfCopies FROM tbl_LibraryBranch x
			JOIN tbl_BookCopies y
			ON x.LB_BranchID = y.BC_BranchID
			JOIN tbl_Books z
			ON y.BC_BookID = z.B_BookID
			WHERE z.B_Title = @bookTitle

			SELECT * FROM tbl_LibraryBranch;
			SELECT * FROM tbl_BookCopies;
			SELECT * FROM tbl_Books;

		END
