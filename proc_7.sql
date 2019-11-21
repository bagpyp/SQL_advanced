--7.) For each book authored (or co-authored) by "Stephen King", 
--retrieve the title and the number of copies owned by 
--the library branch whose name is "Central".

CREATE PROC checkAvailabilityStephenKingAtCentralByTitle
	AS
		BEGIN

			/* select the authors table A and join to the books table B (on bookID) for titles
			join that to the book copies table C (also on bookID) to get the number of copies
			then join that to the li branch table D (on branchID) to get the branch name */

			SELECT 
				A.BA_AuthorName as 'Author',
				B.B_Title as 'Title',
				D.LB_BranchName as 'Branch',
				C.BC_NumberOfCopies as 'Number of Copies'


				FROM 
				tbl_BookAuthors A
				JOIN tbl_Books B
					ON A.BA_BookID = B.B_BookID
				JOIN tbl_BookCopies C
					ON A.BA_BookID = C.BC_BookID
				JOIN tbl_LibraryBranch D
					ON C.BC_BranchID = D.LB_BranchID
						WHERE BA_AuthorName = 'Stephen King'
						AND LB_BranchName = 'Central'

		END