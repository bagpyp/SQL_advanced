CREATE PROC getNumberOfBooksLoanedByBranch
	AS
		BEGIN
			SELECT 
			b.LB_BranchName AS 'Branch Name',
			COUNT(1) AS 'Number Of Books Loaned'
				FROM 
					tbl_BookLoans a 
					JOIN tbl_LibraryBranch b 
					ON a.BL_BranchID = b.LB_BranchID
			GROUP BY b.LB_BranchName;
		END
