SELECT
Count(*) AS MissingValues
From Sales
Where Delivery_Date IS NULL;

SELECT 
Order_Number, Line_Item, Count(*) AS rowscount
From Sales
Group by Order_Number, Line_Item
Having Count(8) > 1;

Select 
MIN(Order_Date) AS FirstOrderDate,
MAX(Order_Date) AS LastOrderDate
From Sales;

Select
Quantity
from sales
Where Quantity <= 0



