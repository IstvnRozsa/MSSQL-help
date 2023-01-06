DECLARE @dates TABLE(dt DATE)    
DECLARE @dateFrom DATE
DECLARE @dateTo DATE

SET @dateFrom = '2001/01/01'
SET @dateTo = GETDATE()

WHILE(@dateFrom <= @dateTo)
BEGIN
   INSERT INTO @dates 
   SELECT @dateFrom

   SELECT @dateFrom = DATEADD(day, 1, @dateFrom)
END

SELECT * FROM @dates