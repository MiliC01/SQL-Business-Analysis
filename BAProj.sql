-- We view the data set for 2019
SELECT TOP (1000) *
FROM [Business Analysis].[dbo].['2019$']
-- We view the data set for 2020
SELECT TOP (1000) *
FROM [Business Analysis].[dbo].['2020$']
-- Checking for null values in both data sets, and removing any rows with null values--
-- We see that when we 
SELECT *
FROM [Business Analysis].[dbo].['2019$'];
ORDER BY [Client ID]

SELECT *
FROM [Business Analysis].[dbo].['2020$']
ORDER BY [Client ID];

--DELETE FROM [Business Analysis].[dbo].['2019$']
--WHERE [Order number] IS NULL
--AND [Client ID] IS NULL
--AND [Product code] IS NULL
--AND [Date of delivery] IS NULL
--AND [Delivery amount] IS NULL;

--DELETE FROM [Business Analysis].[dbo].['2020$']
--WHERE [Order number] IS NULL
--AND [Client ID] IS NULL
--AND [Product code] IS NULL
--AND [Date of delivery] IS NULL
--AND [Delivery amount] IS NULL;


-- We find the new clients in 2020
-- this involves in only counting the Client IDs that con only be found in 2020 but not in 2019
