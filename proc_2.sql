CREATE PROC checkNoCopiesOfBookPerBranch

@bookTitle VARCHAR(50),
@branchName VARCHAR(30)

	AS
		BEGIN
			--2.) How many copies of the book titled "The Lost Tribe" are owned by each library branch? 
			--Do you one better ;)

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