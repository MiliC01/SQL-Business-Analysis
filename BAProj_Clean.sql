-- We view the data set for 2019
SELECT TOP (1000) *
FROM [Business Analysis].[dbo].['2019$'];
-- We view the data set for 2020
SELECT TOP (1000) *
FROM [Business Analysis].[dbo].['2020$'];
-- Checking for null values in both data sets, and removing any rows with null values--
-- We see that when we try to get the Client's ID by increasing order we get null values for the first rows
SELECT *
FROM [Business Analysis].[dbo].['2019$']
ORDER BY [Client ID];

SELECT *
FROM [Business Analysis].[dbo].['2020$']
ORDER BY [Client ID];

-- We delete the rows with null values from both data sets
DELETE FROM [Business Analysis].[dbo].['2019$']
WHERE [Order number] IS NULL
AND [Client ID] IS NULL
AND [Product code] IS NULL
AND [Date of delivery] IS NULL
AND [Delivery amount] IS NULL;

DELETE FROM [Business Analysis].[dbo].['2020$']
WHERE [Order number] IS NULL
AND [Client ID] IS NULL
AND [Product code] IS NULL
AND [Date of delivery] IS NULL
AND [Delivery amount] IS NULL;

-- We take another look at the data and there are still null values so we delete rows where Order Number, Client ID, Product Code, and Date of delivery are null
SELECT *
FROM [Business Analysis].[dbo].['2019$']
ORDER BY [Client ID];

DELETE FROM [Business Analysis].[dbo].['2019$']
WHERE [Order number] IS NULL
AND [Client ID] IS NULL
AND [Product code] IS NULL
AND [Date of delivery] IS NULL;

SELECT *
FROM [Business Analysis].[dbo].['2020$']
ORDER BY [Client ID];

DELETE FROM [Business Analysis].[dbo].['2020$']
WHERE [Order number] IS NULL
AND [Client ID] IS NULL
AND [Product code] IS NULL
AND [Date of delivery] IS NULL;

-- There are 271 Rows in the 2019 data set
SELECT COUNT([Client ID]) AS ClientNumber
FROM ['2019$']

-- There are 507 Rows in the 2020 data set
SELECT COUNT([Client ID]) AS ClientNumber
FROM ['2020$']
