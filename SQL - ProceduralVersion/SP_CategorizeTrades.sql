IF NOT EXISTS (SELECT * FROM sys.types WHERE is_table_type = 1 AND name = 'Trade')
	CREATE TYPE dbo.Trade
	AS TABLE
	(
	  [Value] NUMERIC(18, 2),
	  [ClientSector] NVARCHAR(10)
	);
	GO
GO

IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND  TABLE_NAME = 'Trades')
	CREATE TABLE [dbo].[Trades](
		[ID] [int] IDENTITY(1,1) NOT NULL,
		[Value] [numeric](18, 2) NULL,
		[ClientSector] [nvarchar](10) NULL,
		[Category] [nvarchar](10) NULL
	) ON [PRIMARY]
	GO
GO

CREATE PROCEDURE dbo.CategorizeTrade
  @Trade AS dbo.Trade READONLY
AS
BEGIN
  SET NOCOUNT ON;

  INSERT INTO Trades (Value, ClientSector, Category)
	SELECT [Value], [ClientSector],
		CASE
			WHEN [VALUE] < 1000000 AND [ClientSector] = 'Public' THEN 'LOWRISK' 
			WHEN [VALUE] > 1000000 AND [ClientSector] = 'Public' THEN 'MEDIUMRISK' 
			WHEN [VALUE] > 1000000 AND [ClientSector] = 'Private' THEN 'HIGHRISK' 
		END	
	FROM @Trade; 

	SELECT [Category] FROM Trades
	RETURN
END
GO

---------------TEST------------------------------

DECLARE @portifolio AS Trade

INSERT INTO @portifolio
SELECT 2000000, 'Private' UNION ALL
SELECT 400000, 'Public' UNION ALL
SELECT 500000, 'Public' UNION ALL
SELECT 3000000, 'Public' 

EXEC dbo.CategorizeTrade @portifolio

