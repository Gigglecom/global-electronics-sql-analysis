-- CUSTOMER SEGMENTATION
-- Classify customers by spending level

WITH CustomerValue AS (
SELECT 
c.CustomerKey,
c.Name AS [Customer Name],
c.Country,

COUNT(Distinct s.Order_Number) AS [Total Orders],
SUM(s.Quantity) AS [Total Unit Purchased],

SUM(s.Quantity * p.Unit_Price_USD) AS [Total Spent]


FROM Customers c
JOIN Sales s
ON c.CustomerKey = s.CustomerKey
JOIN Products p
ON s.ProductKey = p.ProductKey
GROUP BY 
c.CustomerKey,
c.Name,
c.Country

),

CustomerRanking AS (
SELECT
*,
NTILE(4) OVER(Order By [Total Spent] DESC) AS Spending
FROM CustomerValue
)

SELECT
CustomerKey,
[Customer Name],
Country,
[Total Orders],
[Total Unit Purchased],
ROUND([Total Spent], 2) AS [Total Spent],
Case 
When Spending = 1 then 'High Value'
When Spending = 2 then 'Medium-High Value'
When Spending = 3 then 'Medium Value'
Else 'Low Value' END AS Ranking


FROM 
CustomerRanking
Order By [Total Spent];


--|||||||||||||||||||||||||||||||
--Customer Segementation BY Revenue

WITH CustomerValue AS (
SELECT 
c.CustomerKey,


SUM(s.Quantity * p.Unit_Price_USD) AS [Total Spent]


FROM Customers c
JOIN Sales s
ON c.CustomerKey = s.CustomerKey
JOIN Products p
ON s.ProductKey = p.ProductKey
GROUP BY 
c.CustomerKey
),

CustomerRanking AS (
SELECT
*,
NTILE(4) OVER(Order By [Total Spent] DESC) AS Spending
FROM CustomerValue
)

SELECT 
Case 
When Spending = 1 then 'High Value'
When Spending = 2 then 'Medium-High Value'
When Spending = 3 then 'Medium Value'
Else 'Low Value' END AS CustomerSegment,
COUNT(*) AS [Total Customers],
ROUND([Total Spent], 2) AS [Total Spent]

FROM CustomerRanking
Group By 
Case 
When Spending = 1 then 'High Value'
When Spending = 2 then 'Medium-High Value'
When Spending = 3 then 'Medium Value'
Else 'Low Value' END, [Total Spent]

Order By CustomerSegment