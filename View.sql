CREATE VIEW SalesAnalysis_Vw AS 
SELECT 

S.Order_Number,
s.Line_Item,
s.Order_Date,
S.Delivery_Date,



c.CustomerKey,
c.Name AS [Customer Name],
c.Country,



p.ProductKey,
P.Product_Name,
p.Category,
p.Subcategory,
p.Brand,


s.StoreKey,

CASE WHEN s.StoreKey =0 Then 'Online' Else 'Physical Store' END AS [Sales Channel],

s.Quantity,


p.Unit_Cost_USD,
p.Unit_Price_USD,

s.Quantity * p.Unit_Price_USD AS Revenue,

s.Quantity * p.Unit_Cost_USD AS Cost,

s.Quantity * (p.Unit_Price_USD - p.Unit_Cost_USD) AS Profit

FROM Sales s 
JOIN Products p
ON s.ProductKey = p.ProductKey
JOIN Customers c
ON s.CustomerKey = c.CustomerKey;

GO

