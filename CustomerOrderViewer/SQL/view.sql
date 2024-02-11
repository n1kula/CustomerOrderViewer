
USE CustomerOrderViewer
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

PRINT 'CustomerOrderDetail'
GO


CREATE VIEW [dbo].[CustomerOrderDetail] AS
	SELECT
		co.CustomerOrderID,
		c.CustomerId,
		c.FirstName,
		c.LastName,
		i.ItemId,
		i.Description,
		i.Price
	FROM
		dbo.CustomerOrder co
	INNER JOIN 
		dbo.Customer c ON co.CustomerId = c.CustomerId
	INNER JOIN
		dbo.Item i ON i.ItemId = co.ItemId
GO