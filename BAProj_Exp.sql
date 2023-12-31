-- We find the new clients in 2020
-- This involves only counting the Client IDs that can only be found in 2020 but not in 2019
SELECT COALESCE(['2020$'].[Client ID], ['2019$'].[Client ID])
FROM ['2020$']
FULL OUTER JOIN ['2019$'] ON ['2019$'].[Client ID]=['2020$'].[Client ID]
WHERE ['2020$'].[Client ID] IS NULL OR ['2019$'].[Client ID] IS NULL;
-- we find that there are no new clients in the system 

-- We now explore how much the seller earned on new products in 2020, 
-- This involves adding delivery amounts from the rows that have product codes that are only found in the 2020 dataset

SELECT SUM(['2020$'].[Delivery amount]) AS NewProductEarnings
FROM ['2020$']
FULL OUTER JOIN ['2019$'] ON ['2019$'].[Product code]=['2020$'].[Product code]
WHERE ['2019$'].[Product code] IS NULL

-- We find that 1509625 units were on new products in 2020
-- We find the average, minimum, and maximum delivery amount in 2019 and 2020
SELECT AVG(['2019$'].[Delivery amount]) AS AvgDeliveryAmt, 
	MIN(['2019$'].[Delivery amount]) AS MinDeliveryAmt, 
	MAX(['2019$'].[Delivery amount]) AS MaxDeliveryAmt
FROM ['2019$'];

SELECT AVG(['2020$'].[Delivery amount]) AS AvgDeliveryAmt, 
	MIN(['2020$'].[Delivery amount]) AS MinDeliveryAmt, 
	MAX(['2020$'].[Delivery amount]) AS MaxDeliveryAmt
FROM ['2020$'];

-- We find the total delivery amounts for each client in 2019 and 2020
SELECT ['2019$'].[Client ID],SUM(['2019$'].[Delivery amount]) AS TotDeliveryAmt
FROM ['2019$']
GROUP BY [Client ID]
ORDER BY TotDeliveryAmt DESC;

SELECT ['2020$'].[Client ID],SUM(['2020$'].[Delivery amount]) AS TotDeliveryAmt
FROM ['2020$']
GROUP BY [Client ID]
ORDER BY TotDeliveryAmt DESC;

-- Finding the number of products ordered by each client in 2019 and 2020
SELECT ['2019$'].[Client ID], COUNT(DISTINCT(['2019$'].[Product code])) AS Products
FROM ['2019$']
GROUP BY ['2019$'].[Client ID]
ORDER BY Products DESC; 

SELECT ['2020$'].[Client ID], COUNT(DISTINCT(['2020$'].[Product code])) AS Products
FROM ['2020$']
GROUP BY ['2020$'].[Client ID]
ORDER BY Products DESC; 

-- Finding the difference between the number of products ordered in 2019 and 2020 and finding how many clients ordered more in 2019 and 2020
SELECT Derived.[Client ID], 
	SUM(Derived.Products) AS Diff
FROM(SELECT ['2020$'].[Client ID], COUNT(DISTINCT(['2020$'].[Product code])) AS Products
	FROM ['2020$']
	GROUP BY ['2020$'].[Client ID]
	UNION ALL
	SELECT ['2019$'].[Client ID], -COUNT(DISTINCT(['2019$'].[Product code])) AS products
	FROM ['2019$']
	GROUP BY ['2019$'].[Client ID]) AS Derived
GROUP BY Derived.[Client ID]
ORDER BY Derived.[Client ID] DESC;

-- We find the number of clients that ordered more in 2020 by finding the number of clients with a positive difference
SELECT COUNT(Tab.[Client ID]) AS MoreIn2020
FROM (SELECT Derived.[Client ID], 
	SUM(Derived.Products) AS Diff
FROM(SELECT ['2020$'].[Client ID], COUNT(DISTINCT(['2020$'].[Product code])) AS Products
	FROM ['2020$']
	GROUP BY ['2020$'].[Client ID]
	UNION ALL
	SELECT ['2019$'].[Client ID], -COUNT(DISTINCT(['2019$'].[Product code])) AS products
	FROM ['2019$']
	GROUP BY ['2019$'].[Client ID]) AS Derived
GROUP BY Derived.[Client ID]) AS Tab 
WHERE Tab.Diff > 0
	
-- We find the number of clients that ordered more in 2019 by finding the number of clients with a negative difference
SELECT COUNT(Tab.[Client ID]) AS MoreIn2019
FROM (SELECT Derived.[Client ID], 
	SUM(Derived.Products) AS Diff
FROM(SELECT ['2020$'].[Client ID], COUNT(DISTINCT(['2020$'].[Product code])) AS Products
	FROM ['2020$']
	GROUP BY ['2020$'].[Client ID]
	UNION ALL
	SELECT ['2019$'].[Client ID], -COUNT(DISTINCT(['2019$'].[Product code])) AS products
	FROM ['2019$']
	GROUP BY ['2019$'].[Client ID]) AS Derived
GROUP BY Derived.[Client ID]) AS Tab 
WHERE Tab.Diff < 0
	
-- Now we find the product with the biggest increase in 2020 compared to 2019
CREATE TABLE #Temp_merge (
ProductCode int)

INSERT INTO #Temp_merge
SELECT ['2020$'].[Product code]
FROM ['2020$']
INNER JOIN ['2019$']
	ON ['2020$'].[Product code] = ['2019$'].[Product code]
GROUP BY ['2020$'].[Product code]

SELECT *
FROM (SELECT SUM(Derived.growth) AS GDiff, Derived.[Product code]
	FROM (SELECT ['2019$'].[Product code], SUM(DISTINCT(['2019$'].[Delivery amount])) AS Growth
			FROM ['2019$']
			GROUP BY ['2019$'].[Product code]
			UNION ALL
			SELECT ['2020$'].[Product code], - SUM(DISTINCT(['2020$'].[Delivery amount])) AS growth
			FROM ['2020$']
			GROUP BY ['2020$'].[Product code]) AS Derived
	GROUP BY Derived.[Product code]) AS Diff
RIGHT OUTER JOIN #Temp_merge
	ON Diff.[Product code] = #Temp_Merge.ProductCode
ORDER BY Diff.GDiff
-- We find that the product with the biggest increase is product 495720 with a product increase of 74591
