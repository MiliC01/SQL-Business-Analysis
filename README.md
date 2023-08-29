# SQL & Tableau Small Business Data Analysis Project

In this project, we clean and analyze data designed for business analysis which can be found in the Datasets of Kaggle under the name of [Business Analysis (junior)](https://www.kaggle.com/datasets/sticktogethertm/business-analysis-junior) uploaded by Igor Panteleev. The data is divided into two sheets of a .xlsx file under the names 2019 and 2020. Both data sets have the variables:

- Order Number
- Client ID
- Product code
- Date of delivery
- Delivery amount

The data contains null values and has to be cleaned. We create two documents in this repository called BAProj_Clean.sql and BAProj_Exp.sql where we document all the SQL queries where we clean and analyze the data. To visualize the data we will use Tableau.

# Data Cleaning

We start by downloading the data sets from Kaggle and uploading them to a new database called Business Analysis. We add the data sets by right-clicking the database type and under the [Tasks] tab select [import data...] 
![importing the data sets](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(769).png?raw=true)

On the SQL Server Import and Export Wizard we select Microsoft Excel as the Data source option and select the file path where the Excel document is stored in File Explorer.
![Selecting Data Source](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(770).png?raw=true)
After this part, uploading the Excel documents to the database is simple and the data can be found under Tables. 

We first view the data sets for 2019 and 2020. We can confirm by looking at the data sets that they have the same variables, we now check for null values in both data sets, and remove any rows with null values. We can see that there are null values in both data sets from the images below:
![Null Values in 2019 data](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(754).png?raw=true)
![Null Values in 2020 Data](https://github.com/MiliC01/SQL-Business-Analysis/blob/main/SQLBAProj/Screenshot%20(755).png?raw=true)

After deleting the null values, we take another look at the data and we see that there are still null values, so we delete the rows where Order, number, Client ID, Product Code, and Date of Delivery are null. After this, we check that there are no null values and get the number of rows of each data set. We find that there are 271 rows in the 2019 data set, and 507 rows in the 20220 data set. 


# Data Analysis

# Data Visualization
