
Select 
Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Revenue],

Round(
		Sum(s.Quantity * p.Unit_Cost_USD), 2) AS [Total Cost],

Round(
		Sum(s.Quantity * p.Unit_Price_USD) - Sum(s.Quantity * p.Unit_Cost_USD), 2) AS [Total Profit],

COUNT(DISTINCT s.CustomerKey) AS [Total Customer],

Count(DISTINCT s.Order_Number) AS [Total Order],
Sum(s.Quantity)AS [Total Units Sold],

Round(Sum(s.Quantity * (p.Unit_Price_USD - p.Unit_Cost_USD))/
		NULLIF(Sum(s.Quantity * p.Unit_Price_USD),0) * 100, 2) AS [Profit Margin],

		Sum(s.Quantity * p.Unit_Price_USD) / Count(Order_Number) AS [Average Order Value]


From Sales s 
JOIN Products p
ON s.ProductKey = p.ProductKey;


--Analyze Revenue By Year
--How did the company perform each year?
SELECT 
Year(ss.Order_Date) AS [Sales YEAR],
Round(
		SUM(ss.Quantity * pp.Unit_Price_USD), 2) as [Total Revnue],

ROUND(
        SUM(ss.Quantity * (pp.Unit_Price_USD - pp.Unit_Cost_USD)),
        2) AS TotalProfit,

Count(Distinct ss.Order_Number) as Total_Oders,

Sum(ss.Quantity) AS Total_Unit_Sold

From Sales ss
JOIN Products pp
ON ss.ProductKey = pp.ProductKey
GROUP BY Year(ss.Order_Date)
Order By [Sales YEAR];


--||||||||||||||||||||||||||||||||
--Best Performing Product

Select
Distinct p.Category AS [Product_Category],

Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Revenue],
		
ROUND(
        SUM(s.Quantity * (p.Unit_Price_USD - p.Unit_Cost_USD)),
        2) AS TotalProfit
		,
Count(DISTINCT s.Order_Number) AS [Total Order],
Sum(s.Quantity)AS [Total Units Sold]

FROM Sales s
JOIN Products p
ON s.ProductKey = p.ProductKey
Group By p.Category
Order BY [Total Revenue];


--|||||||||||||||||||||||||||||||||
-- BUSINESS QUESTION:
-- How do online and physical store sales compare?

Select 
Case When s.StoreKey = 0 Then 'Online' else 'Physical Store' end AS [Sales Channels],

Round(
		Sum(s.Quantity * p.Unit_Price_USD), 2)  as [Total Revenue],
Round(
		Sum(s.Quantity * p.Unit_Price_USD) - Sum(s.Quantity * p.Unit_Cost_USD), 2) AS [Total Profit],
Count(DISTINCT s.Order_Number) AS [Total Order],
Sum(s.Quantity)AS [Total Units Sold]

From Sales s
JOIN Products p
ON s.ProductKey = p.ProductKey
JOIN Stores st
ON s.StoreKey = st.StoreKey

Group By Case When s.StoreKey = 0 Then 'Online' else 'Physical Store' end
Order by [Total Revenue]


