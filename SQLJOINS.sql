/* joins: select all the computers from the products table:
using the products table and the categories table, return the product name and the category name */
 SELECT p.name AS 'product_name', c.name AS 'category_name' FROM products AS p  JOIN categories AS c
 ON c.categoryid = p.categoryid WHERE c.name = 'computers';
 
/* joins: find all product names, product prices, and products ratings that have a rating of 5 */
 SELECT p.name AS 'product_name', p.price AS 'product_price', r.rating AS 'product_rating'
FROM products AS p JOIN reviews AS r ON p.productid = r.productid WHERE r.rating = 5;
 
/* joins: find the employee with the most total quantity sold.  use the sum() function and group by */
SELECT SUM(s.quantity) AS 'Quantity', e.FirstName FROM sales AS s INNER JOIN employees AS e 
ON s.employeeid=e.employeeid GROUP BY e.firstname ORDER BY Quantity DESC;

/* joins: find the name of the department, and the name of the category for Appliances and Games */
SELECT d.name, c.name AS 'product_name' FROM departments AS d JOIN categories AS c 
ON d.departmentid = c.departmentid WHERE c.name = 'Appliances' OR c.name = 'Games';

/* joins: find the product name, total # sold, and total price sold,
 for Eagles: Hotel California --You may need to use SUM() */
SELECT p.name, SUM(s.quantity), (p.price * SUM(s.quantity)) FROM products AS p
JOIN sales AS s ON p.productid = s.productid WHERE p.name = 'Eagles: Hotel California'
GROUP BY p.name, p.price;
/* joins: find Product name, reviewer name, rating, and comment on the Visio TV. (only return for the lowest rating!) */
SELECT p.name, r.reviewer, r.rating, r.comment FROM products AS p JOIN reviews AS r
on p.productid = r.productid WHERE p.name = 'visio tv'
LIMIT 1;

-- ------------------------------------------ Extra - May be difficult
/* Your goal is to write a query that serves as an employee sales report.
This query should return:
-  the employeeID
-  the employee's first and last name
-  the name of each product
-  and how many of that product they sold */ 
SELECT e.employeeid, e.firstname, e.lastname, p.productid, p.name, SUM(s.quantity)
FROM employees AS e JOIN sales AS s ON e.employeeid = s.EmployeeID
JOIN products AS p ON p.productid = s.productid GROUP BY e.employeeid, p.productid;