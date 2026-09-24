ALTER TABLE Sales
ADD CONSTRAINT FK_Sales_CustomerKey
Foreign Key (CustomerKey)
References Customers(CustomerKey);

ALTER TABLE Sales
ADD CONSTRAINT FK_sales_Producykey
Foreign Key (ProductKey)
References Products(ProductKey);

Alter Table Sales
ADD Constraint FK_sales_StoreKey
Foreign Key (StoreKey)
References Stores(StoreKey);