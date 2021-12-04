
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE _VoteManager
	@user VARCHAR(20),
	@userIp VARCHAR(50)
AS
BEGIN
	SET NOCOUNT ON;

	-- Check if user NOT FOUND

	--IF NOT EXISTS (SELECT 1 FROM SRO_VT_ACCOUNT..TB_User WHERE StrUserID = @user)
	--BEGIN
	--	SELECT 'user not found' as error
	--	RETURN;
	--END

	-- Check if same IP vote before, you can delete this log every 12h
	IF EXISTS (SELECT 1 FROM _VoteLog WHERE userIp = @userIp)
	--BEGIN
	--	SELECT 'this ip already voted for last 12 hour' as error
	--	RETURN;
	--END

	DECLARE @Silk INT = 30 

	DECLARE @JID INT = (SELECT JID FROM SRO_VT_ACCOUNT..TB_User WHERE StrUserID = @user)

	EXEC SRO_VT_ACCOUNT..CGI_WebPurchaseSilk @JID, @Silk
	
	SELECT 'DONE' as result

END	
GO
