USE CustomerOrderViewer;

CREATE TYPE [dbo].[CustomerORderType] AS TABLE
(
	CustomerOrderID INT NOT NULL,
	CustomerID INT NOT NULL,
	ItemID int NOT NULL
);
GO


CREATE PROCEDURE [dbo].[CustomerOrderDetails_GetList]
AS
    SELECT
        *
    FROM
        dbo.CustomerOrderDetail
    WHERE
        IsActive = CONVERT(BIT, 1)
GO

CREATE PROCEDURE [dbo].[CustomerOrderDetails_Delete]
	@CustomerOrderId INT,
	@UserId VARCHAR(50)
AS
	UPDATE CustomerOrder
	SET
		IsActive = CONVERT(BIT, 0),
		UpdateId = @UserId,
		UpdatedAt = GETDATE()
	WHERE
		CustomerOrderId = @CustomerOrderId AND
		IsActive = CONVERT(BIT, 1);
GO

CREATE PROCEDURE [dbo].[CustomerOrderDetails_Upsert]
	@CustomerOrderType CustomerOrderType READONLY,
	@UserId VARCHAR(50)
AS
	MERGE INTO CustomerOrder TARGET
	USING
	(
		SELECT
			CustomerOrderId,
			CustomerId,
			ItemId,
			@USerId [UpdateId],
			GETDATE() [UpdatedAt],
			@UserId [CreateId],
			GETDATE() [CreatedAt]
		FROM
			@CustomerOrderType
	) AS SOURCE
	ON
	(
		TARGET.CustomerOrderId = SOURCE.CustomerOrderId
	)
	WHEN MATCHED THEN
		UPDATE SET
			TARGET.CustomerId = SOURCE.CustomerId,
			TARGET.ItemId = SOURCE.ItemId,
			TARGET.UpdateId = SOURCE.UpdateId,
			TARGET.UpdatedAt = SOURCE.UpdatedAt
	WHEN NOT MATCHED BY TARGET THEN
		INSERT (CustomerId, ItemId, CreateId, CreatedAt, UpdateId, UpdatedAt, IsActive)
		VALUES (SOURCE.CustomerId, SOURCE.ItemId, SOURCE.CreateId, SOURCE.CreatedAt, SOURCE.UpdateId, SOURCE.UpdatedAt, CONVERT(BIT, 1));
GO