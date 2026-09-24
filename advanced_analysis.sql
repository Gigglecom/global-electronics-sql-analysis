-- BUSINESS QUESTION:
-- Which products generate the most revenue?
-- Top 10 Best Performing Product
SELECT TOP 10
p.Product_Name,
p.Brand,
p.Category,
Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Revenue],

Sum(s.Quantity)AS [Total Units Sold]

FROM Products p
JOIN Sales s
ON p.ProductKey = s.ProductKey
GROUP BY 
p.Product_Name,
p.Brand,
p.Category
ORDER BY [Total Revenue];

-- BUSINESS QUESTION:
-- Which countries generate the most revenue?
SELECT 
st.Country,
Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Revenue],
Round(
		Sum(s.Quantity * p.Unit_Price_USD) - Sum(s.Quantity * p.Unit_Cost_USD), 2) AS [Total Profit],
Count(Distinct s.Order_Number) AS [Total Orders]

FROM Stores st
JOIN Sales s
ON st.StoreKey = s.StoreKey
JOIN Products p
ON p.ProductKey = s.ProductKey
WHERE s.StoreKey <> 0
GROUP BY st.Country
Order By [Total Revenue];

-- BUSINESS QUESTION:
-- Who are the company's highest-value customers?

SELECT TOP 10
c.Name AS [Customer Name],
c.Gender,
c.Country,
Count(DISTINCT s.Order_Number) AS [Total Order],
Sum(s.Quantity)AS [Units Purchased],
Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Spend]


FROM Customers c
JOIN Sales s
ON c.CustomerKey = s.CustomerKey
JOIN Products p
ON p.ProductKey = s.ProductKey
GROUP BY 
c.Name,
c.Gender,
c.Country
Order By [Total Spend];

-- BUSINESS QUESTION:
-- How does revenue change month by month?
SELECT
Year(s.Order_Date) AS Yearly,
Month(s.Order_Date) As [Month sales],
DateName(Month, s.Order_Date) as Month_,
Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Revenue],
Count(DISTINCT s.Order_Number) AS [Total Order]

FROM Sales s
JOIN Products p
ON s.ProductKey = p.ProductKey
Group by 
Year(s.Order_Date),
Month(s.Order_Date),
DateName(Month, s.Order_Date)
Order By Yearly, [Month sales];

-- ADVANCED ANALYSIS:
-- Rank products by revenue within each category

WITH Product_Revenue AS (
Select
p.Product_Name AS [Product Name],
p.Category AS [Category],
Sum(s.Quantity * p.Unit_Price_USD) as [Total Revenue]
from Products p
JOIN Sales s
ON p.productKey = s.ProductKey
GROUP BY 
p.Product_Name,
p.Category
)

Select
[Product Name],
Category,
ROUND([Total Revenue], 2),

Rank() OVER(Partition By Category Order By [Total Revenue] DESC) AS [Product Rank]

From Product_Revenue
Order By Category, [Product Rank];

-- ADVANCED ANALYSIS:
-- Calculate year-over-year revenue growth
WITH Yearly_Sales AS(
SELECT
Year(Order_Date) AS Yearly,

Sum(s.Quantity * p.Unit_Price_USD) as [Total Revenue]

FROM Sales s
JOIN Products p
ON s.ProductKey = p.ProductKey
Group By Year(Order_Date)

),

Revenue_Comparison AS (
Select
Yearly,
[Total Revenue],

Lag([Total Revenue]) Over ( Order By Yearly) AS Previous_Year_Revenue


From Yearly_Sales

)



SELECT
Yearly,
ROUND([Total Revenue], 2) AS Total_Revenue,
ROUND(Previous_Year_Revenue, 2) AS Previous_Year_Revenue,

ROUND(
([Total Revenue]- Previous_Year_Revenue) / ISNULL(Previous_Year_Revenue, 0) * 100, 2) AS [YoY Growth Percentage]

FROM Revenue_Comparison
Order By Yearly

