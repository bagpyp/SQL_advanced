CREATE PROC searchSharpstownForDueBooks
	AS
		BEGIN

			DECLARE @todaysDate DATE, @branchName VARCHAR(30);
			SET @todaysDate = getDate();
			SET @branchName = 'Sharpstown';

			/* take the book loans table A and join it to the branch table B (on branch ID) to filter by 'sharpstown'
			join that to the books table C (in book ID) to be able to query the name of the book
			join that to the borrowers table D (on card No) to be able to query the 1. name, 2. address of the borrower */

			SELECT 
				B.LB_BranchName as 'Branch Name',
				C.B_Title as 'Book Title',
				A.BL_DateDue as 'Due Date',
				D.Bo_Name as 'Borrower',
				D.Bo_Address as 'Borrower Address'
					FROM tbl_BookLoans A
						JOIN tbl_LibraryBranch B
							ON A.BL_BranchID = B.LB_BranchID
						JOIN tbl_Books C 
							ON A.BL_BookID = C.B_BookID
						JOIN tbl_Borrower D 
							ON A.BL_CardNo = D.Bo_CardNo

			WHERE B.LB_BranchName = @branchName 
				AND A.BL_DateDue = @todaysDate
			;
		END
