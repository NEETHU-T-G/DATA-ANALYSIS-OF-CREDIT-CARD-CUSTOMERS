USE [project 4] 
SELECT * FROM Bank ORDER BY 8 DESC
SELECT Attrition_Flag,Customer_Age,Gender,Education_Level,Marital_Status,Income_Category,Total_Relationship_Count,Months_Inactive_12_mon,Avg_Utilization_Ratio FROM Bank
WHERE Attrition_Flag='Attrited Customer'
ALTER TABLE Bank
ADD Age_Group VARCHAR(255)
UPDATE Bank
SET Age_Group= CASE WHEN Customer_Age <20 THEN 'Below 20'
WHEN Customer_Age BETWEEN 20 AND 30 THEN '20-30'
WHEN Customer_Age BETWEEN 30 AND 40 THEN '30-40'
WHEN Customer_Age  BETWEEN 40 AND 50 THEN '40-50'
WHEN Customer_Age  BETWEEN 50 AND 60 THEN '50-60'
WHEN Customer_Age  BETWEEN 60 AND 70 THEN '60-70'
WHEN Customer_Age  BETWEEN 70 AND 80 THEN '70-80'
WHEN Customer_Age >80 THEN 'Above 80'
ELSE 'Not Defined' END 

SELECT * FROM Bank
SELECT MIN(Customer_Age) AS Min_Age FROM Bank WHERE Attrition_Flag='Attrited Customer'
SELECT MAX(Customer_Age) AS Max_Age FROM Bank WHERE Attrition_Flag='Attrited Customer'

--Age Range of Attrited Customers--
SELECT Age_Group,COUNT(*) Total FROM Bank WHERE Attrition_Flag='Attrited Customer'
GROUP BY Age_Group ORDER BY 2 DESC

--Details of attrited customers between the age 40 to 50--
SELECT Customer_Age,Gender,Education_Level,Marital_Status,Income_Category,Total_Relationship_Count,Months_Inactive_12_mon,Avg_Utilization_Ratio FROM Bank
WHERE Attrition_Flag='Attrited Customer' AND Age_Group='40-50' AND Gender='M'
SELECT Customer_Age,Gender,Education_Level,Marital_Status,Income_Category,Total_Relationship_Count,Months_Inactive_12_mon,Avg_Utilization_Ratio FROM Bank
WHERE Attrition_Flag='Attrited Customer' AND Age_Group='40-50' AND Gender='F'
SELECT COUNT(*) AS Total_Attrited_Female_40_50 FROM Bank WHERE Attrition_Flag='Attrited Customer'AND Age_Group='40-50' AND Gender='F'
SELECT COUNT(*) AS Total_Attrited_Male_40_50 FROM Bank WHERE Attrition_Flag='Attrited Customer'AND Age_Group='40-50' AND Gender='M'

--Average age of existing and attrited customer--
SELECT AVG(Customer_Age) FROM Bank WHERE Attrition_Flag='Attrited Customer' AND Gender='M'
SELECT AVG(Customer_Age) FROM Bank WHERE Attrition_Flag='Attrited Customer' AND Gender='F'
SELECT AVG(Customer_Age) FROM Bank WHERE Attrition_Flag='Existing Customer'  AND Gender='M'
SELECT AVG(Customer_Age) FROM Bank WHERE Attrition_Flag='Existing Customer'  AND Gender='F'

--Number of Males & Females in existing and attrited customer--
SELECT SUM(CASE WHEN Gender='M' THEN 1 ELSE 0 END) AS Total_Males,SUM(CASE WHEN Gender='F' THEN 1 ELSE 0 END) AS Total_Females FROM Bank WHERE Attrition_Flag='Attrited Customer'
SELECT SUM(CASE WHEN Gender='M' THEN 1 ELSE 0 END) AS Total_Males,SUM(CASE WHEN Gender='F' THEN 1 ELSE 0 END) AS Total_Females FROM Bank WHERE Attrition_Flag='Existing Customer'

--Attrited Customers & Existing Customer as per education level--
SELECT Education_Level,COUNT(*) AS Total FROM Bank WHERE Attrition_Flag='Attrited Customer' GROUP BY Education_Level ORDER BY 2 DESC 
SELECT Education_Level,COUNT(*) AS Total FROM Bank WHERE Attrition_Flag='Existing Customer' GROUP BY Education_Level ORDER BY 2 DESC 
--Attrited Customers & Existing Customer as per Marital Status--
SELECT Marital_Status ,COUNT(*) AS Total FROM Bank WHERE Attrition_Flag='Attrited Customer' GROUP BY Marital_Status ORDER BY 2 DESC 
SELECT Marital_Status,COUNT(*) AS Total FROM Bank WHERE Attrition_Flag='Existing Customer' GROUP BY Marital_Status  ORDER BY 2 DESC 
--Attrited Customers & Existing Customer as per Income_Category--
SELECT Income_Category,COUNT(*) Total FROM Bank WHERE Attrition_Flag='Attrited Customer'
GROUP BY Income_Category ORDER BY 2 DESC
SELECT Income_Category,COUNT(*) Total FROM Bank WHERE Attrition_Flag='Existing Customer'
GROUP BY Income_Category ORDER BY 2 DESC
--Month on book range of Attrited & Existing Customer--
ALTER TABLE Bank
ADD Months_on_book_range VARCHAR(255)
UPDATE Bank
SET Months_on_book_range=CASE 
WHEN Months_on_book BETWEEN 10 AND 20 THEN '10-20'
WHEN Months_on_book BETWEEN 20 AND 30 THEN '20-30'
WHEN Months_on_book BETWEEN 30 AND 40 THEN '30-40'
WHEN Months_on_book BETWEEN 40 AND 50 THEN '40-50'
WHEN Months_on_book BETWEEN 50 AND 60 THEN '50-60'
ELSE NULL
END
SELECT Months_on_book_range,COUNT(*) as Total_Customers FROM Bank WHERE Attrition_Flag='Attrited Customer' GROUP BY Months_on_book_range  ORDER BY 2 DESC
SELECT Months_on_book_range,COUNT(*) as Total_Customers FROM Bank WHERE Attrition_Flag='Existing Customer' GROUP BY Months_on_book_range  ORDER BY 2 DESC

--Number of customers as per inactive month--
SELECT Months_Inactive_12_mon,COUNT(*) AS Total_Customers FROM Bank  WHERE Attrition_Flag='Attrited Customer' GROUP BY Months_Inactive_12_mon ORDER BY 2 DESC 
SELECT Months_Inactive_12_mon,COUNT(*) AS Total_Customers FROM Bank  WHERE Attrition_Flag='Existing Customer' GROUP BY Months_Inactive_12_mon ORDER BY 2 DESC 
--Average Utilization of Customer's Card--
SELECT AVG(Avg_Utilization_Ratio) AS Average_Utilization FROM Bank  WHERE Attrition_Flag='Attrited Customer'
SELECT AVG(Avg_Utilization_Ratio) AS Average_Utilization FROM Bank  WHERE Attrition_Flag='Existing Customer'
