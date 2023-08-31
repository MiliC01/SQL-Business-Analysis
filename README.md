# SQL & Python Small Business Data Cleaning and EDA

In this project, we clean and analyze data designed for business analysis which can be found in the Datasets of Kaggle under the name of [Business Analysis (junior)](https://www.kaggle.com/datasets/sticktogethertm/business-analysis-junior) uploaded by Igor Panteleev. The data is divided into two sheets of a .xlsx file under the names 2019 and 2020. Both data sets have the variables:

- Order Number
- Client ID
- Product code
- Date of delivery
- Delivery amount

The data contains null values and has to be cleaned. We create two documents in this repository called BAProj_Clean.sql and BAProj_Exp.sql where we document all the SQL queries where we clean and analyze the data. Additionally, we use Python for more complex queries that involve data visualization where we use the MatPlotLib and Seaborn packages.

# Data Cleaning

We start by downloading the data sets from Kaggle and uploading them to a new database called Business Analysis. We add the data sets by right-clicking the database type and under the [Tasks] tab select [import data...] 
![importing the data sets](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(769).png?raw=true)

On the SQL Server Import and Export Wizard we select Microsoft Excel as the Data source option and select the file path where the Excel document is stored in File Explorer.
![Selecting Data Source](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(770).png?raw=true)
After this part, uploading the Excel documents to the database is simple and the data can be found under Tables. 

We first view the data sets for 2019 and 2020. We can confirm by looking at the data sets that they have the same variables, we now check for null values in both data sets and remove any rows with null values. We can see that there are null values in both data sets from the images below:

![Null Values in 2019 data](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(754).png?raw=true)
![Null Values in 2020 Data](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(755).png?raw=true)

After deleting the null values, we take another look at the data and we see that there are still null values, so we delete the rows where Order, number, Client ID, Product Code, and Date of Delivery are null. After this, we check that there are no null values and get the number of rows of each data set. We find that there are 271 rows in the 2019 data set and 507 rows in the 20220 data set. 

![2019 number of rows](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(773).png?raw=true)
![2020 number of rows](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(774).png?raw=true)

Following this data cleaning, we proceed to explore and analyze the data.

# Data Analysis

For this explorative data analysis, we look at:
1) Are there new clients in 2020?
2) How much did the seller earn on new products in 2020?
3) What is the average, minimum, and maximum delivery amount in 2019 and 2020?
4) What are the total delivery amounts for each client in 2019 and 2020?
5) How many products were ordered by each client in 2019 and 2020, and how many clients ordered more products in 2019 and 2020?
6) Find the product with the biggest increase in 2020 compared to 2019

### 1) Are there new clients in 2020?
We find that there are no new clients in 2020
![2020 new clients](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(775).png?raw=true)

### 2) How much did the seller earn on new products in 2020?
We find that 1509625 units were on new products in 2020
![2020 new products](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(776).png?raw=true)

### 3) What is the average, minimum, and maximum delivery amount in 2019 and 2020?

![2019 average, minimum, and maximum delivery amount](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(778).png?raw=true)

We can see that for 2019, the average delivery amount is 35,093.89, the minimum delivery amount is 1267, and the maximum delivery amount is 65583 units.

![2020 average, minimum, and maximum delivery amount](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(777).png?raw=true)

For 2020, the average delivery amount is 33,227.37, the minimum delivery amount is 1308, and the maximum delivery amount is 65891 units.
We can see that there is a greater dry amount in 2020. 

### 4) What are the total delivery amounts for each client in 2019 and 2020?

![2019 total delivery amount](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(782).png?raw=true)

We can see that for 2019 the Client DI with the greatest total delivery amount is 7167 with a total delivery amount of 1394776.

![2020 total delivery amount](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(781).png?raw=true)

For 2020 the Client DI with the greatest total delivery amount is 7158 with a total delivery amount of 2035274. We can see that client 7167 is ninth on the 2020 list with a total delivery amount of 712610 indicating this client ordered less in 2020. 

### 5) How many products were ordered by each client in 2019 and 2020 and how many clients ordered more products in 2019 and 2020?
We can see the number of different products ordered by each client in 2019 below
![2019 products ordered](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(784).png?raw=true)
We can see the number of different products ordered by each client in 2020 below
![2020 products ordered](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(783).png?raw=true)
Now we find the difference in the number of products ordered in 2020 compared to 2019 by each client
![2020-2019 products ordered](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(787).png?raw=true)
We can see that most differences are positive meaning there were more products ordered by each client in 2020. Under closer inspection, we can see that 20 out of 21 clients bought more types of products in 2020 while only 1 out of 21 clients:

![2020-2019 products ordered count 2020](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(785).png?raw=true)

![2020-2019 products ordered count 2019](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(786).png?raw=true)

### 6) Find the product with the biggest increase in 2020 compared to 2019
![2020-2019 big increase](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(790).png?raw=true)

We can see that the product with the biggest increase in 2020 compared to 2019 is product 495720 with a growth of 74591
