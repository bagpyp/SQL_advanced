CREATE PROC findPeopleWithNoBooksCheckedOut
	AS
		BEGIN

			--3.) Retrieve the names of all borrowers who do not have any books checked out.
			--database has no Book IN/OUT column :/ this will query anyone who has 
			--never checked out a book, which is no one in our database.

			SELECT DISTINCT x.Bo_Name FROM tbl_Borrower x 
				JOIN tbl_BookLoans y 
				ON x.Bo_CardNo = y.BL_CardNo
				WHERE y.BL_DateOut IS NULL

		END


