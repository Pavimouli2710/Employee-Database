USE [PhoenixMobile]
GO

/****** Object:  StoredProcedure [dbo].[PRMOBILEUSERLOGIN]    Script Date: 19-04-2021 12:43:27 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[PRMOBILEUSERLOGIN]
(
	@USERNAME	VARCHAR(500),
	@PASSWORD	VARCHAR(500)
)
AS
BEGIN

	IF NOT EXISTS (
		SELECT '1'
		FROM	TBLMOBILEUSERSIGNUP (NOLOCK)
		WHERE	FLDUSERNAME = @USERNAME
	)
	BEGIN
		RAISERROR('USERNAME DOES NOT EXIST!', 16, 1)
		RETURN
	END

	
	SELECT FLDUSERID 
			, FLDDTKEY
	FROM TBLMOBILEUSERSIGNUP
	WHERE FLDUSERNAME = @USERNAME
	AND FLDPASSWORD = @PASSWORD

END
GO

