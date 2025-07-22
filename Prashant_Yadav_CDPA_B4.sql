-- Objective: Retrieve data using basic SELECT statements
-- List the names of all customers in the database.
use northwind;
-- select * from customers;
select CustomerName
from customers;
-- Analysis: List of customer names.

------------------------------------------------------

-- Objective: Apply filtering using the WHERE clause
-- Retrieve the names and prices of all products that cost less than $15.
-- select * from products;
select ProductName
from products
where Price < 15;
-- Analysis: 24 products are having price lass than 15.

------------------------------------------------------

-- Objective: Use SELECT to extract multiple fields
-- Display all employees first and last names.
-- select * from employees;
select FirstName, LastName
from employees;
-- Analysis: List of employees name.

------------------------------------------------------

-- Objective: Filter data using a function on date values
-- List all orders placed in the year 1997.
-- select * from orders;
select OrderID, OrderDate
from orders
where OrderDate between '1997-01-01 00:00:00' and '1997-12-31 00:00:00';
-- Analysis: 44 orders were placed in year 1997.

------------------------------------------------------

-- Objective: Apply numeric filters
-- List all products that have a price greater than $50.
-- select * from products;
select ProductName, Price
from products
where Price > 50;
-- Analysis: Côte de Blaye is the most expensive product.

------------------------------------------------------

-- Objective: Perform multi-table JOIN operations
-- Show the names of customers and the names of the employees who handled their orders.
-- select * from customers;
-- select * from employees;
-- select * from orders;
select c.CustomerName, e.FirstName, e.LastName
from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join employees e on e.EmployeeID = o.EmployeeID;
-- Analysis: List of employees handled customers.

------------------------------------------------------

-- Objective: Use GROUP BY for aggregation
-- List each country along with the number of customers from that country.
-- select * from customers;
select Country, count(CustomerID) as CustomerCount
from customers
group by Country;
-- Analysis: USA have the highest customer count.

------------------------------------------------------

-- Objective: Group data by a foreign key relationship and apply aggregation
-- Find the average price of products grouped by category.
-- select * from products;
-- select * from categories;
select c.CategoryName, avg(p.Price) as AvgPrice
from categories c
inner join products p on c.CategoryID = p.CategoryID
group by c.CategoryID;
-- Analysis: Meat/Poultry category have highest average price among other categoires while grains/cereals have least average price.

------------------------------------------------------

-- Objective: Use aggregation to count records per group
-- Show the number of orders handled by each employee.
-- select * from employees;
-- select * from orders;
select EmployeeID, count(OrderID) as OrderCount
from orders
group by EmployeeID;
-- Analysis: EmployeeID 4 have handled most orders while employeeID 9 have handled least orders.

------------------------------------------------------

-- Objective: Filter results using values from a joined table
-- List the names of products supplied by "Exotic Liquids".
-- select * from suppliers;
-- select * from products;
with elsupplier as (select SupplierID from suppliers where SupplierName = 'Exotic Liquid')
select p.ProductName
from products p
inner join elsupplier e on p.SupplierID = e.SupplierID;
-- Analysis: Products supplied by Exotic Liquids are Chais, Chang and Aniseed Syrup.

------------------------------------------------------

-- Objective: Rank records using aggregation and sort
-- List the top 3 most ordered products (by quantity).
-- select * from orderdetails;
select ProductID, sum(Quantity) as TotalOrdered
from orderdetails
group by ProductID
order by TotalOrdered desc limit 3;
-- Analysis: Top 3 most ordered products have product id 31,60,35.

------------------------------------------------------

-- Objective: Use GROUP BY and HAVING to filter on aggregates
-- Find customers who have placed orders worth more than $10,000 in total.

-- select * from orderdetails;
-- select * from products;
-- select * from customers;
-- select * from orders;
select c.CustomerName, sum(od.Quantity * p.Price) as TotalSpent
from customers c
inner join orders o on c.CustomerID = o.CustomerID
inner join orderdetails od on o.OrderID = od.OrderID
inner join products p on od.ProductID = p.ProductID
group by c.CustomerID
having sum(od.Quantity * p.Price) > 10000
order by TotalSpent;
-- Analysis: 13 customers placed order with order value more than 10000.

------------------------------------------------------

-- Objective: Aggregate and filter at the order level
-- Display order IDs and total order value for orders that exceed $2,000 in value.
-- select * from orders;
-- select * from orderdetails;
-- select * from products;
select o.OrderID, sum(od.Quantity * p.Price) as OrderValue
from orders o
inner join orderdetails od on o.OrderID = od.OrderID
inner join products p on od.ProductID = p.ProductID
group by o.OrderID
having sum(od.Quantity * p.Price) > 2000
order by OrderValue;
-- Analysis: 70 order Id's have order value more than 2000.

------------------------------------------------------

-- Objective: Use subqueries in HAVING clause
-- Find the name(s) of the customer(s) who placed the largest single order (by value).
-- select * from orderdetails;
-- select * from products;
-- select * from customers;
-- select * from orders;
select c.CustomerName, o.OrderID, sum(od.Quantity * p.Price) as TotalValue
from orders o
inner join customers c on c.CustomerID = o.CustomerID
inner join orderdetails od on o.OrderID = od.OrderID
inner join products p on od.ProductID = p.ProductID
group by o.OrderID
having sum(od.Quantity * p.Price) = (select max(OrderTotal)
					from (select o2.OrderID, sum(od2.Quantity * p2.Price) as OrderTotal
                                        from orders o2
                                        inner join orderdetails od2 on o2.OrderID = od2.OrderId
                                        inner join products p2 on od2.ProductID = p2.ProductID
                                        group by o2.OrderID)
					as ordersum);
-- Analysis: Queen Cozinha with order id 10372 placed the largest single order.

------------------------------------------------------

-- Objective: Identify records using NOT IN with subquery
-- Get a list of products that have never been ordered.
-- select distinct(ProductID) from orderdetails;
-- select * from products;
select ProductName
from products
where ProductID not in (select distinct(ProductID) from orderdetails);
-- Analysis: All products have been ordered.
